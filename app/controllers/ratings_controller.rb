class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end

  def show
    if params[:id] && rating = Game.find_by(params[:rating_id])
      @ratings = Game.all
      render :show
    else 
      render :index
    end 
  end
end
