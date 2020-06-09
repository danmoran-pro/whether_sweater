class Hike
  attr_reader :id, :name, :summary, :distance_to_trail
  
  def initialize(trail, location)
    @id = 1 
    @name = trail[:name]
    @summary = trail[:summary]
    @difficulty = trail[:difficulty]
    @start = location
    @to = trail[:location]
    @distance_to_trail = distance_calculation[:route][:distance]
  end

  def distance_calculation
    MapService.new(@start, @to).get_distance
  end 
end 
