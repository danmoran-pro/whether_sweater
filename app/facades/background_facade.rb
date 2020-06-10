class BackgroundFacade

  attr_reader :location
  
  def initialize(location)
    @location = location
  end

  def unsplash_service
    @unsplash_service = UnsplashService.new(@location).get_background
  end

  def background
    unsplash_service
    Background.new(@unsplash_service)
  end
end 