class Api::V1::ForecastController < ApplicationController

  def index 
    forecast_data = ForecastFacade.new(params[:location])
  end 
end 