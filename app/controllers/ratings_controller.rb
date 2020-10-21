require 'pry'
class RatingsController < ApplicationController

  def index
    @ratings = Rating.find_by_id(params[:id])
  end

  def show
    @ratings = current_user.games.where(params[:id] == :rating_id)
    binding.pry
    #current_user.ratings.where()
    render :show
  end

  private

  def set_games
    @games = current_user.games.find_by_id(params[:id])
  end 
end

