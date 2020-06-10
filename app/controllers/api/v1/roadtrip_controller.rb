class Api::V1::RoadtripController < ApplicationController

  def create 
    api_key = params[:api_key]
    user = User.find_by(api_key: api_key)
    if user.api_key && user
      road_trip = RoadtripFacade.new(road_trip_params)
      render status: 200, json: RoadtripSerializer.new(road_trip)
    else
      render status: 400, json: {error: @user.errors.full_messages.to_sentence}
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end 
