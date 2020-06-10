require 'rails_helper'

RSpec.describe "Can get weather for a city", :vcr, type: 'request' do
  before(:each) do 
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    
    @backgrounds_data = JSON.parse(response.body)['data']['attributes']
  end 
  describe "when requesting 'backgrounds?location=denver,co'" do
    it "Can get an image for location " do 
  		expect(@backgrounds_data).to have_key('url')
    end 
  end 
end 