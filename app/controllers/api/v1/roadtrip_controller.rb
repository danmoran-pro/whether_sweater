class Api::V1::RoadtripController < ApplicationController

  def create 
    user = User.find_by(api_key: params[:api_key])
    if user && user.api_key
      road_trip = RoadtripFacade.new(road_trip_params).roadtrip
      render status: 200, json: RoadtripSerializer.new(road_trip)
    else
      render json: { status: 400,  error: "no API key or an incorrect key is provide" }
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end 
