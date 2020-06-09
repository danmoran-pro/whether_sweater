class Unsplash_Service
 
  def initialize(location)
    @location = location
    binding.pry
  end

  def get_background
    background_data = conn.get("/search/photos") do |req|
      req.params[:query] = @location
  end 
  
  private
  def conn
		Faraday.new(url: "https://api.unsplash.com/") do |f|
		  f.params[:client_id] = ENV["UNSPLASH_API_KEY"]
		  f.adapter  Faraday.default_adapter
    end
	end

end 