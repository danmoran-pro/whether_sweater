class Zomato_Service
 
  def initialize(lat_lng, craving)
    @lat = lat_lng[:lat]
    @lng = lat_lng[:lng]
    @craving
  end
  
  def get_resturants
    resturant_data = Faraday.new(url:"https://developers.zomato.com/api/v2.1/search?apikey=#{ENV['Zomato_API_KEY']}&q=#{@craving}&lat=#{@lat}&lon=#{@lng}").get
    binding.pry
    json = JSON.parse(resturant_data.body, symbolize_names: true)
	end

end 