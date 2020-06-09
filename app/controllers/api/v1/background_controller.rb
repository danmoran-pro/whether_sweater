class Api::V1::BackgroundController < ApplicationController
  def index 
    background_data = BackgroundFacade.new(params[:location])#background
  end 
end 