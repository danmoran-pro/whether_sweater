class OwocService
 
  def initialize(lat_lng)
    @lat = lat_lng[:lat]
    @lng = lat_lng[:lng]
  end
  
  def get_forecast
    forecast_data = Faraday.new(url: "https://api.openweathermap.org/data/2.5/onecall?lat=#{@lat}&lon=#{@lng}&appid=#{ENV['OWOC_API_KEY']}&units=imperial").get
    json = JSON.parse(forecast_data.body, symbolize_names: true)
	end

end 