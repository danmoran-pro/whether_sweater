class Forecast
  attr_reader :id, :current_weather, :hourly_weather, :daily_weather, :weekly_weather
  
  def initialize(weather_service)
    @id = 1 
    @weather_data = weather_service
    @current_weather = current_weather
    @hourly_weather = hourly_weather
    @daily_weather = daily_weather
    @daily_weather = weekly_weather
  end

  def current_weather
    {time:  Time.at(@weather_data[:current][:dt]),
    temperature: @weather_data[:current][:temp],
    discription: @weather_data[:current][:weather][0][:description],
    high: @weather_data[:daily][0][:temp][:max],
    low: @weather_data[:daily][0][:temp][:min]}
    # location: #??
  end

  def daily_weather
    {discription: @weather_data[:current][:weather][0][:description],
    feels_like: @weather_data[:current][:feels_like],
    humidity:  @weather_data[:current][:humidity],
    uv_index: @weather_data[:current][:uvi],
    sunrise: Time.at(@weather_data[:current][:sunrise]),
    sunset: Time.at(@weather_data[:current][:sunset])}
    # visibility: #???
  end 

  def weekly_weather
    @weather_data[:daily].map do |day|
      {time: Time.at(day[:dt]),
        high: day[:temp][:max],
        low: day[:temp][:min],
        description: day[:weather].first[:description]}
      end
    end
    
    def hourly_weather
      @weather_data[:hourly].map do |hour|
        {time: Time.at(hour[:dt]),
         temp: hour[:temp],
         description: hour[:weather].first[:description]}
    end 
  end
end 
