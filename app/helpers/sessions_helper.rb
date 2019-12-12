# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    user.remember
    session[:name] = user.name
    current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:name)
    @current_user = nil
  end

  def forget(user)
    user.forget_token
  end

  def current_user
    @current_user ||= User.find_by(name: session[:name])
  end

  def require_login
    unless logged_in?
      flash[:danger] = 'You need to be logged in'
      redirect_to login_path
    end
  end
end
