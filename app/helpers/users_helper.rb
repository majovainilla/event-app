module UsersHelper
  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    cookies.permanent[:remember_token] = nil
    @current_user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:remember_token)
  end
end
