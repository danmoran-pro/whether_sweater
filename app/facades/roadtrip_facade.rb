class RoadtripFacade

  attr_reader :id, :origin, :destination
  
  def initialize(road_trip_params)
    @start = road_trip_params[:origin]
    @dest = road_trip_params[:destination]
    binding.pry
  end
  
  def destination_service
    @distance_data = GoogleService.new(@start, @dest).get_distance
  end

end