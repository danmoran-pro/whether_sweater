class MapService

  def initialize(from, to)
    @from = from
    @to = to 
  end 

  def get_distance
    location_data = conn.get("directions/v2/route") do |req|
			req.params[:from] = @from
			req.params[:to] = @to
			req.params[:routeType] = 'fastest'
		end
    json = JSON.parse(location_data.body, symbolize_names: true)
  end 
  

  
  private
  def conn
		Faraday.new(url: "https://www.mapquestapi.com/") do |f|
		  f.params[:key] = ENV["MAPQUEST_API_KEY"]
		  f.adapter  Faraday.default_adapter
    end
	end
end