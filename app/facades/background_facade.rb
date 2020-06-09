class BackgroundFacade

  attr_reader :location
  
  def initialize(location)
    @location = location
    binding.pry
  end

  def unsplash_service
    @unsplash_service = Unsplash.new(@location)
  end 
end 