class Roadtrip
  attr_reader :id, :orgin, :destination, :travel_time, :arival_forcast, :forcast_description
  
  def initialize(distance_data, forecast)
    @id = nil
    @orgin = distance_data[:start_address]
    @destination = distance_data[:end_address]
    @travel_time = distance_data[:duration][:text]
    @arival_forcast = forecast.current_weather[:temperature]
    @forcast_description = forecast.current_weather[:discription]
  end 
end 