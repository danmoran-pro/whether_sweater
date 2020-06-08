class FoodieFacade

  attr_reader :location
  
  def initialize(start, dest, craving)
    @start = start
    @dest = dest
    @craving = craving
    binding.pry
  end
  
  def destination_service
    @distance_data = GoogleService.new(@start, @dest).get_distance
  end
  
  def zomato_service
    destination_service
    @zomato_service = ZomatoService.new(@distance_data, @craving).get_resturants
  end 

  def resturant 
    zomato_service
    zomato_data = zomato_service[:restaurants][0][:restaurant][:location]
    foodie = Foodie.new(zomato_data, @distance_data)
  end  
end