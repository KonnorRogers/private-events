module SessionsHelper
  # logs in the user via cookies
  # @param user [User] logs in the given user
  def login(user)
    session[:user_id] = user.id
  end

  # deletes the cookies
  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  # finds the user from cookies, if its nil, will return nil
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # checks if the user is logged in
  def logged_in?
    !current_user.nil?
  end
end
