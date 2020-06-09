class Api::V1::TrailsController < ApplicationController

  def index 
    trial_data = TrailsFacade.new(params[:location])#.trial
    render json: TrailsSerializer.new(trial_data)
  end 
end 