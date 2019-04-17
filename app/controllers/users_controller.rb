class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
