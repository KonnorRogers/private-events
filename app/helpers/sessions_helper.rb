module SessionsHelper
  # logs in the user via cookies
  # @param user [User] logs in the given user
  def login(user)
    # cookies[:user_id] = user.id
    # cookies[:user_name] = user.name
    session[:user_id] = user.id
  end

  # deletes the cookies
  def logout
    # cookies.delete :user_id
    # cookies.delete :user_name
    session[:user_id] = nil
    @current_user = nil
  end

  # finds the user from cookies, if its nil, will return nil
  def current_user
    # if cookies[:user_id]
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # checks if the user is logged in
  def logged_in?
    !current_user.nil?
  end
end
