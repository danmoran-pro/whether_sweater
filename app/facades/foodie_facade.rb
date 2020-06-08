class FoodieFacade

  attr_reader :location
  
  def initialize(start, dest, craving)
    @start = start
    @dest = dest
    @craving = craving
    binding.pry
  end
  
  def destination_service
    @distance_data = GoogleService.new(@start, @dest).get_distance
  end
  
  def zomat
    google_service
    @weather_service = OwocService.new(@lat_lng).get_forecast
  end 

  # def resturant 
  #   weather_service
  #   forecast = Forecast.new(@weather_service)
  # end  
end