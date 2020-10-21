require 'pry'
class GamesController < ApplicationController
  before_action :check_for_logged_in

  def new
    #check if it's nested & it's a proper id
    if params[:rating_id] && rating = Rating.find_by_id(params[:rating_id])
      #nested route
      @game = rating.games.build #has_many
    else
      #unnested
      @game = Game.new
      @game.build_rating  
    end
  end

  def create
    @game = current_user.games.build(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      @game.build_rating unless @game.rating
      render :new
    end
  end

  def index
    @ratings = Rating.all
    if params[:rating_id] && rating = Rating.find_by_id(params[:rating_id])
      #nested route
      @games = current_user.games.order_by_title
    elsif 
       #if params[:genre]
        #  @games = Game.search_by_genre(params[:genre]).order_by_genre.includes(:rating,:user)
         # @games = Game.order_by_genre if @games == []
      
          #@games = Game.includes(:rating,:user).order_by_genre
          #@action = Game.action_genre
          #@platformers = @games.platformers
          #@action = @games.action
        @games = current_user.games.most_recent(5)
          render :index
        end

  end

  def show
   if params[:rating_id]
    @game = Game.find_by(id: params[:rating_id])
    #binding.pry
   else
    set_game
   end

  end

  def edit
    set_game
    #binding.pry
  end

  def update
    set_game
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    set_game
    @game.destroy
    redirect_to games_path
  end


  private 

  def set_game
    @game = Game.find_by(id: params[:id])
    #binding.pry
    if !@game
      redirect_to games_path
    end 
  end 

  def game_params
    params.require(:game).permit(:title, :genre, :rating_id, rating_attributes: [:score])
  end

                                                           

end 
