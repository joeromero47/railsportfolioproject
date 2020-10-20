class UsersController < ApplicationController

    #loading signup
  def new
    @user = User.new

  end
  
  #creating signup
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user
      redirect_to games_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
