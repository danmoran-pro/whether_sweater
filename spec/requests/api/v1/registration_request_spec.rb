require 'rails_helper'

RSpec.describe "Can create a user and return and api_key", :vcr, type: 'request' do
  before(:each) do 
    @new_user_1 = {"email": "sample@example.com",
                   "password": "password",
                   "password_confirmation": "password"}

    @new_user_2 = {"email": "sample@example.com",
                   "password": "password",
                   "password_confirmation": "password1"}
  end 
  describe "when creating a new user'" do
    it "should return a status 200 if successful" do 
     
      post '/api/v1/users', params: @new_user_1, as: :json 

      expect(response.status).to eq(201)
      expect(User.count).to eq(1)#may not need this
      
      user_data = JSON.parse(response.body)['data']['attributes']

      expect(user_data).to_not eql(nil)
      expect(user_data).to have_key("api_key")

    end 
  end 
  # it 'should return a 400 response if email already exists' do
   
  #   User.create(email: 'sample@example.com', 
  #               password: 'password', 
  #               password_confirmation: 'password')

  #   post '/api/v1/users', params: @new_user_1

  #   expect(response.status).to eq(400)
  #   expect(User.count).to eq(0)

  #   user_data = JSON.parse(response.body)
    

  #   expect(user_data).to have_key("error")
  #   expect(user_data["error"]).to eql('Email Already Exists')
  # end 
  # it 'should return a status 400 if passwords do not match' do
    
  #   post '/api/v1/users', params: @new_user_2, as: :json 
    
  #   expect(response.status).to eq(400)
  #   expect(User.count).to eq(0)
    
  #   user_data = JSON.parse(response.body)
    
  #   expect(user_data).to have_key("error")
  #   expect(user_data["error"]).to eql('Passwords do not match')
  # end
end 