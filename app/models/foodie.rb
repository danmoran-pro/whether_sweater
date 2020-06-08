class Foodie
  attr_reader :id, :end_location, :travel_time, :forecast, :restaurant
  
  def initialize(zomato_data, distance_data)
    @id = 1 
    binding.pry
    @travel_time = distance_data[:duration][:text]
    @end_location = distance_data[:end_address]
    @restaurant = 
    # @daily_weather = daily_weather
    # @daily_weather = weekly_weather
  end

  def current_weather
    {time:  Time.at(@weather_data[:current][:dt]),
    temperature: @weather_data[:current][:temp],
    discription: @weather_data[:current][:weather][0][:description],
    high: @weather_data[:daily][0][:temp][:max],
    low: @weather_data[:daily][0][:temp][:min]}
    # location: #??
  end
end 
