class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to @user
    else
      flash.now[:danger] = 'Unable to create user'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
