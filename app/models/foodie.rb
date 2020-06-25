class Foodie
  attr_reader :id, :end_location, :travel_time, :forecast, :restaurant
  
  def initialize(zomato_data, distance_data)
    @id = nil 
    @end_location = distance_data[:end_address]
    @travel_time = distance_data[:duration][:text]
    @zomato_data = zomato_data
    @weather_data =  OwocService.new(distance_data[:end_location]).get_forecast
    @forecast = foodie_weather
    @restaurant = foodie_resturant
  end

  def foodie_weather
    {temperature: @weather_data[:current][:temp],
     summary: @weather_data[:current][:weather][0][:description]}
  end

  def foodie_resturant 
    {name: @zomato_data[:name],
    address: @zomato_data[:location][:address]}
  end 

end 
