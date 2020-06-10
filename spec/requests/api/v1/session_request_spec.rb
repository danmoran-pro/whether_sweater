require 'rails_helper'

RSpec.describe 'Session created upon logging in ' do
  it 'can login with valid credentials' , :vcr do
    User.create(email: 'sample@example.com', 
                password: 'password',  
                password_confirmation: 'password', 
                api_key: "ca456b14-609c-4b2b-9e3b-69d1bbcfa3ea")
    
    @new_user_1 = {"email": "sample@example.com",
                    "password": "password",
                    "password_confirmation": "password"}

    post '/api/v1/sessions', params: @new_user_1

    user_data = JSON.parse(response.body)

    expect(response.status).to eq(200)

    expect(user_data['data']['attributes']).to have_key("api_key")
    expect(user_data['data']['attributes']['api_key']).not_to eql(nil)
  end
end 