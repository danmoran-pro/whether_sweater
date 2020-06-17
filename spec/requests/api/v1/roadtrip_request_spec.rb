
require 'rails_helper'

RSpec.describe "Can get roadtrip, and weather for a city", :vcr, type: 'request' do
  before(:each) do
      @user_1  = User.create(email: 'sample@example.com', 
                  password: 'password',  
                  password_confirmation: 'password', 
                  api_key: "ca456b14-609c-4b2b-9e3b-69d1bbcfa3ea")

    @road_trip_1 = {"origin": "Denver, CO",
                   "destination": "ueblo, CO",
                   "api_key": "#{@user_1.api_key}"}
    
    @road_trip_2 = {"origin": "Denver, CO",
                   "destination": "pueblo, CO"}

                  end 
  describe "when requesting road trip, api key, origin, and destination'" do
    it "Can get an weather for location, summary and travel time." do 
     
      post "/api/v1/road_trip", params: @road_trip_1, as: :json
  
      expect(response).to be_successful
      
      @roadtrip_data = JSON.parse(response.body)['data']
      
      expect(@roadtrip_data['type']).to eq('roadtrip')
      expect(@roadtrip_data).to have_key('attributes')
      
		  expect(@roadtrip_data['attributes']).to have_key('orgin')
      expect(@roadtrip_data['attributes']).to have_key('destination')
      
      expect(@roadtrip_data['attributes']).to have_key('travel_time')
      
      expect(@roadtrip_data['attributes']).to have_key('arival_forcast')
		  expect(@roadtrip_data['attributes']).to have_key('forcast_description')
      
    end 
    it "can not get roadtrip if api_key is missing " do 
      post "/api/v1/road_trip", params: @road_trip_2, as: :json
      
      @roadtrip_data = JSON.parse(response.body)['data']
      
      expect(response.status).to eq(400) 
      
      expect(@roadtrip_data).to have_key('error')
      
    end 
  end 
end 
