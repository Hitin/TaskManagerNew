class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def users_params
    params.require(:user).permit(:name)
  end
end