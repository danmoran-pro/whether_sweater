class GoogleService

  def initialize(location,  destination = nil)
    @location = location
    @destination = destination
  end 

  def get_location
    location_data = conn.get("geocode/json") do |req|
			req.params[:address] = @location
		end
    json = JSON.parse(location_data.body, symbolize_names: true)
    lat_lng = json[:results][0][:geometry][:location]
  end 

  def get_distance
    location_data = conn.get("directions/json") do |req|
			req.params[:origin] = @location
			req.params[:destination] = @destination
		end
    json = JSON.parse(location_data.body, symbolize_names: true)
    distance_data = json[:routes][0][:legs][0]
  end 
  

  
  private
  def conn
		Faraday.new(url: "https://maps.googleapis.com/maps/api/") do |f|
		  f.params[:key] = ENV["GOOGLE_API_KEY"]
		  f.adapter  Faraday.default_adapter
    end
	end
end