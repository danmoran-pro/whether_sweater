class ForecastFacade

  attr_reader :location
  
  def initialize(location)
    @location = location
  end 
  
  def google_service
    @lat_lng = GoogleService.new(@location).get_location
  end
  
  def weather_service
    google_service
    @weather_service = OwocService.new(@lat_lng).get_forecast
  end 

  def forecast 
    weather_service
    forecast = Forecast.new(@weather_service)
  end  
end