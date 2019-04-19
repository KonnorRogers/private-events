class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = 'User successfully created'
      redirect_to @user
    else
      flash.now[:danger] = 'Unable to create user'
      render 'new'
    end
  end

  def show
    redirect_to(login_path) unless logged_in?

    @user = User.find(params[:id])
    @events = @user.events.where(creator_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
