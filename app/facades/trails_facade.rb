class TrailsFacade

  attr_reader :location
  
  def initialize(location)
    @location = location
    binding.pry
  end 

  def google_service
    @lat_lng = GoogleService.new(@location).get_location
  end

  def hiking_service
    google_service
    @hike = HikingService.new(@lat_lng).get_hike
    @hike_data = {}
    @hike[:trails].map do |trail|
      @hike_data[:name] = trail[:name]
      @hike_data[:summary] = trail[:summary]
      @hike_data[:difficulty] = trail[:difficulty]
      @hike_data[:location] = trail[:location]
    end 
    @hike_data
  end

  def weather_service
    hiking_service
    @weather_service = OwocService.new(@lat_lng).get_forecast
  end 
  
  def map_service
    weather_service
    binding.pry
    @distance_to_trail = MapService.new(@hike).get_location
  end

  

end