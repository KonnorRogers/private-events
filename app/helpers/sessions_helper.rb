module SessionsHelper
  def login(user)
    cookies.signed[:user_id] = user.id
    cookies.signed[:user_name] = user.name
  end

  def logout(user)

  end

  def current_user
    if cookies[:user_id] || cookies[:user_name]
      User.find_by(id: cookies[:user_id]) || User.find_by(name: cookies[:user_name])
    end
  end

  def logged_in?
    return true if current_user

    false
  end
end
