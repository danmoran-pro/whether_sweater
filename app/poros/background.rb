class Background 
  attr_reader :id, :url
 
  def initialize(unsplash_service)
    @id = nil
    @url = unsplash_service[:results][0][:urls][:regular]
  end 

end 