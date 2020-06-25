require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email } 
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest } 
    it { should have_secure_password }
  end 
  
  describe 'methods' do
    it 'create api key upon creating' do
    params = {email: "sample@example.com",
              password: "password",
              password_confirmation: "password"}

    user = User.create(params)
    #not sure why test isnt passing.
    #also need to fix edge case.  
    expect(user.api_key).not_to be_nil
    end
  end
end 