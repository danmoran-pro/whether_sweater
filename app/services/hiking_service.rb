class HikingService
 
  def initialize(lat_lng)
    @lat = lat_lng[:lat]
    @lng = lat_lng[:lng]
  end
  
  def get_hike
  binding.pry
    forecast_data = Faraday.new(url: "https://www.hikingproject.com/data/get-trails?lat=#{@lat}&lon=#{@lng}&key=#{ENV['HIKING_API_KEY']}").get
    json = JSON.parse(forecast_data.body, symbolize_names: true)
  end
end 