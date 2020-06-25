require 'rails_helper'

RSpec.describe "Can get weather for a city", :vcr, type: 'request' do
  before(:each) do 
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    
    @forecast_data = JSON.parse(response.body)['data']['attributes']
  end 
  describe "when requesting 'forecast?location=denver,co'" do
    it "Can get current Weather " do 
    
    # expect(@forecast_data).to have_key('location')
    expect(@forecast_data).to have_key('current_weather')
    expect(@forecast_data).to have_key('hourly_weather')
    expect(@forecast_data).to have_key('weekly_weather')

    # location = @forecast_data['location']

    # expect(location).to have_key('city')
    # expect(location).to have_key('state')
    # expect(location).to have_key('country')

#     current_weather = @forecast_data['current_weather']
    
    expect(current_weather).to have_key('time')
    expect(current_weather).to have_key('temperature')
    expect(current_weather).to have_key('discription')
    expect(current_weather).to have_key('high')
    expect(current_weather).to have_key('low')
    end 
    
    it "Can get hourly Weather " do 
    
      hourly_weather = @forecast_data['hourly_weather']
      
      expect(hourly_weather.count).to eq(8)
      expect(hourly_weather.first).to have_key('time')
      expect(hourly_weather.first).to have_key('temp')
      expect(hourly_weather.first).to have_key('description')
    end 

    it "Can get daily Weather " do 
    
      daily_weather = @forecast_data['daily_weather']
      
      expect(daily_weather).to have_key('description')
      expect(daily_weather).to have_key('feels_like')
      expect(daily_weather).to have_key('humidity')
      expect(daily_weather).to have_key('uv_index')
      expect(daily_weather).to have_key('sunrise')
      expect(daily_weather).to have_key('sunset')
    end 

    it "Can get weekly Weather " do 
    
      weekly_weather = @forecast_data['weekly_weather']

      expect(weekly_weather.count).to eq(8)
      expect(weekly_weather.first).to have_key('time')
      expect(weekly_weather.first).to have_key('high')
      expect(weekly_weather.first).to have_key('low')
      expect(weekly_weather.first).to have_key('description')
    end 
  end 
end 
