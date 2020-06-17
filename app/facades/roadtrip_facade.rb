class RoadtripFacade

  attr_reader  :origin, :destination
  
  def initialize(road_trip_params)
    @start = road_trip_params[:origin]
    @dest = road_trip_params[:destination]
    @forecast = ForecastFacade.new(@dest).forecast
  end
  
  def destination_service
    @distance_data = GoogleService.new(@start, @dest).get_distance
  end

  def roadtrip 
    destination_service
    Roadtrip.new(@distance_data, @forecast)
  end
end