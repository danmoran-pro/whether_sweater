sclass Api::V1::ForecastController < ApplicationController

  def index 
    forecast_data = ForecastFacade.new(params[:location]).forecast
    render json: ForecastSerializer.new(forecast_data)
  end 
end 