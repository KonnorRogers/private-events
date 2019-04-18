class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:session][:name])
    if @user
      login(@user)
      redirect_to @user, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid name given"
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'You have successfully logged out'
    redirect_to root_url
  end
end
