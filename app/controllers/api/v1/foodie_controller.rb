class Api::V1::FoodieController < ApplicationController

  def index 
    resturant_data = FoodieFacade.new(params[:start], params[:end], params[:search])#.resturant
    binding.pry
    render json: FoodieSerializer.new(Foodie_data)
  end 
end 