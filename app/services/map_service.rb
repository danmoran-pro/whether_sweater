class MapService

  def initialize(location)
    @location = location
  end 

  def get_location
    location_data = conn.get("directions/v2/route") do |req|
			req.params[:from] = @location
			req.params[:to] = @location
			req.params[:routeType] = fastest
		end
    json = JSON.parse(location_data.body, symbolize_names: true)
    lat_lng = json[:results][0][:geometry][:location]
  end 
  

  
  private
  def conn
		Faraday.new(url: "https://www.mapquestapi.com/") do |f|
		  f.params[:key] = ENV["MAPQUEST_API_KEY"]
		  f.adapter  Faraday.default_adapter
    end
	end
end