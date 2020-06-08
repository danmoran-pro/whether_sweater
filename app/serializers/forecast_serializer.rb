class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather, :daily_weather, :hourly_weather, :weekly_weather
end