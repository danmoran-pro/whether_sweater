require 'rails_helper'

RSpec.describe "Can get weather for a city", :vcr, type: 'request' do
	it "when requesting 'forecast?location=denver,co'" do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    forecast_data = JSON.parse(response.body)['data']['attributes']
    
    expect(forecast_data).to have_key('location')
    expect(forecast_data).to have_key('current_weather')
    expect(forecast_data).to have_key('hourly_forecast')
    expect(forecast_data).to have_key('weekly_forecast')

    location = forecast_data['location']

    expect(location).to have_key('city')
    expect(location).to have_key('state')
    expect(location).to have_key('country')

    current_weather = forecast_data['current_weather']
    
    expect(current_weather).to have_key('current_forecast')
    expect(current_weather).to have_key('current_evening_forecast')
    
    expect(current_weather['current_forecast']).to have_key('summary')
    expect(current_weather['current_forecast']).to have_key('precipitation_probability')
    expect(current_weather['current_forecast']).to have_key('temperature')
    expect(current_weather['current_forecast']).to have_key('apparent_temperature')
    expect(current_weather['current_forecast']).to have_key('humidity')
    expect(current_weather['current_forecast']).to have_key('visibility')
    expect(current_weather['current_forecast']).to have_key('uvIndex')

    expect(current_weather['current_evening_forecast']).to have_key('summary')
    expect(current_weather['current_evening_forecast']).to have_key('precipitation_probability')
    expect(current_weather['current_evening_forecast']).to have_key('temperature')
    expect(current_weather['current_evening_forecast']).to have_key('apparent_temperature')
    expect(current_weather['current_evening_forecast']).to have_key('humidity')
    expect(current_weather['current_evening_forecast']).to have_key('visibility')
    expect(current_weather['current_evening_forecast']).to have_key('uvIndex')
    
    hourly_forecast = forecast_data['hourly_forecast']

    expect(hourly_forecast.count).to eq(8)
    expect(hourly_forecast[0]).to have_key('time')
    expect(hourly_forecast[0]['time']).not_to be_empty
    expect(hourly_forecast[0]).to have_key('temperature')

    weekly_forecast = forecast_data['weekly_forecast']

    expect(weekly_forecast.count).to eq(5)
    expect(weekly_forecast[0]).to have_key('time')
    expect(weekly_forecast[0]['time']).to_not be_empty
    expect(weekly_forecast[0]).to have_key('temperature_low')
    expect(weekly_forecast[0]).to have_key('summary')
    expect(weekly_forecast[0]).to have_key('temperature_high')
    expect(weekly_forecast[0]).to have_key('humidity')
  end 
end 