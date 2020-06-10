class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render status: 200, json: UserSerializer.new(@user)
    else
      render status: 400, json: {error: @user.errors.full_messages.to_sentence}
    end
  end
end 