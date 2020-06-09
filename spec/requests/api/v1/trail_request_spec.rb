require 'rails_helper'

RSpec.describe "Can get trail, and weather for a city", :vcr, type: 'request' do
  before(:each) do 
    get "/api/v1/trails?location=denver,co"

    expect(response).to be_successful
    
    @trail_data = JSON.parse(response.body)['data']
  end 
  describe "when requesting 'trails?location=denver,co'" do
    it "Can get an weather for location " do 

      expect(@trail_data).to have_key('type')
      expect(@trail_data).to have_key('attributes')
      
		  expect(@trail_data['attributes']).to have_key('location')
      expect(@trail_data['attributes']).to have_key('forecast')
      
		  expect(@trail_data['attributes']['forecast']).to have_key('summary')
		  expect(@trail_data['attributes']['forecast']).to have_key('temperature')
   
    end 
    # it "Can get an weather for location " do 

    #   expect(@trail_data).to have_key('trails')
      
		#   expect(@trail_data['trails']).to have_key('name')
		#   expect(@trail_data['trails']).to have_key('summary')
    #   expect(@trail_data['trails']).to have_key('difficulty')
		#   expect(@trail_data['trails']).to have_key('location')
		#   expect(@trail_data['trails']).to have_key('distance_to_trail')
    # end 
  end 
end 



# MAPQUEST_API_KEY
# q1

## Instructions

# 1. Create a branch off of your Sweater Weather project called `final_assessment`.
# 1. As you work, you should commit to this branch **every 15 minutes**.
# 1. DO NOT push your code to your GitHub repo until the end of the 3 hour assessment
# 1. Complete the assignment below. You should:
#     * TDD all of your work
#     * Prioritize getting your code functional before attempting any refactors
#     * Write/refactor your code to achieve good code quality

# ## Assignment

# You will build an endpoint that will retrieve the forecast for a location and nearby trails with the distance to each trail.

# Your endpoint should follow this format:

# `GET /api/v1/trails?location=denver,co`

# Your API will return:
# - current forecast for the city
# - name of the trail
# - summary of each trail
# - difficulty of each trail
# - location of each trail
# - estimated travel time for each trail

# Your response should be similar to the format below:

# ```
# {
#   "data": {
#     "id": "null",
#     "type": "trail",
#     "attributes": {
#       "location": "denver,co",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "trails": [
#         {
#           "name": "Boulder Skyline Traverse",
#           "summary": "The classic long mountain route in Boulder."
#           "difficulty": "black"
#           "location": "Superior, Colorado"
#           "distance_to_trail": "23.008"
#         },
#         {
#           "name": "Bear Peak Out and Back",
#           "summary": "A must-do hike for Boulder locals and visitors alike!"
#           "difficulty": "black"
#           "location": "Boulder, Colorado"
#           "distance_to_trail": "30.098"
#         },
#         {...}
#       ]
#     }
#   }
# }
# ```

## APIs

# You are required to consume the following APIs:

# 1. MapQuest Directions API
#     - to find out the distance from the start location to the trail location
#     - Sign Up for Key: https://developer.mapquest.com/
#     - Documentation: https://developer.mapquest.com/documentation/directions-api/
# 1. Hiking Project Data API
#     - Use the getTrails endpoint to find trails near the location
#     - Documentation: https://www.hikingproject.com/data
# 1. Open Weather Map API
#     - to find the forecast for the current location
#     - https://openweathermap.org/api