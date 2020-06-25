class TrailsFacade

  attr_reader :id, :location
  
  def initialize(location)
    @id = 1
    @location = location
  end 

  def google_service
    @lat_lng = GoogleService.new(@location).get_location
  end

  def trails
    binding.pry
    google_service
    hike = HikingService.new(@lat_lng).get_hike
    hike[:trails].map do |trail|
      Hike.new(trail, @location)
    end   
  end

  def forecast
    trails
    @weather_service = OwocService.new(@lat_lng).get_forecast
    data = Forecast.new(@weather_service).current_weather
  end 
end