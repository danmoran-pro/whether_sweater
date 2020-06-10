class Api::V1::UserController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
        @user.api_key = SecureRandom.uuid
        @user.save
        render status: 201, json: UserSerializer.new(@user)
    else
        render status: 400, json: {error: @user.errors.full_messages.to_sentence}
    end
  end

  private
  def user_params
      params.permit(:email, :password, :password_confirmation)
  end 
end 