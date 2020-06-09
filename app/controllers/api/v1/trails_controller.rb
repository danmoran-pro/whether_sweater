class Api::V1::TrailsController < ApplicationController

  def index 
    trial_data = TrailsFacade.new(params[:location])#.trial
    # render json: TrialSerializer.new(trial_data)
  end 
end 