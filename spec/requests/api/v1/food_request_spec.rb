require 'rails_helper'

RSpec.describe "Can get food for a city", :vcr, type: 'request' do
  it "Can get destination " do 
    start = 'denver,co'
    end_location = 'pueblo,co'
    cravings = 'italian'

    get "/api/v1/foodie?start=#{start}&end=#{end_location},search=#{cravings}"
    

    
    foodie_data = JSON.parse(response.body)['data']

    expect(foodie_data["type"]).to eq('foodie')

    expect(foodie_data['attributes']['end_location']).to_not eq(nil)
    expect(foodie_data['attributes']['travel_time']).to_not eq(nil)

    expect(foodie_data['attributes']['forecast']['temperature']).to_not eq(nil)
    expect(foodie_data['attributes']['forecast']['summary']).to_not eq(nil)
  end
end

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