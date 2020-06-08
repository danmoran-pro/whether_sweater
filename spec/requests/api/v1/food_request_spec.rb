require 'rails_helper'

RSpec.describe "Can get food for a city", :vcr, type: 'request' do
  it "Can get destination " do 
    start = 'denver,co'
    end_location = 'pueblo,co'

    get "/api/v1/foodie?start=#{start},co&end=#{end_location}"
      
    expect(response).to be_successful
    
    travel_time= JSON.parse(response.body)['data']

    expect(travel_time["data"]["type"]).to eq('foodie')

    expect(travel_time['attributes']['end_location']).to eq('pueblo,co')
    expect(travel_time['attributes']['travel_time']).to_not eq(nil)

    expect(travel_time['attributes']['forecast'][:summary]).to eq('Cloudy with a chance of meatballs')
    expect(travel_time['attributes']['forecast'][:temperature]).to eq('83')
  end

  # it "Can get resturant " do 
  #   start = 'denver,co'
  #   end_location = 'pueblo,co'
  #   cravings = 'italian'

  #   get "/api/v1/foodie?start=#{start},co&end=#{end_location}&search=#{cravings}"
      
  #   expect(response).to be_successful
    
  #   travel_time= JSON.parse(response.body)['data']

  #   expect(travel_time["data"]["type"]).to eq('foodie')

  #   expect(travel_time['attributes']['end_location']).to eq('pueblo,co')
  #   expect(travel_time['attributes']['travel_time']).to_not eq(nil)

  #   expect(travel_time['attributes']['forecast'][:summary]).to eq('Cloudy with a chance of meatballs')
  #   expect(travel_time['attributes']['forecast'][:temperature]).to eq('83')

  #   expect(travel_time['restaurant']['name']).to eq("Angelo's Pizza Parlor")
  #   expect(travel_time['restaurant']['address']).to eq('105 E Riverwalk, Pueblo 81003')

  # end
end

​
# `GET /api/v1/foodie?start=denver,co&end=pueblo,co&search=italian`
# ​
# Your API will return:
# - the end city
# - estimated travel time
# - the name and address of a restaurant that matches the search parameter
# - the forecast at the end city
# ​
# Your response should be similar to the format below:
# ​
# ```
# {
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }
# }
# ```