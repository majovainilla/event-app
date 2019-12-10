# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    cookies.permanent[:remember_token] = nil
    @current_user = nil
  end

  def forget(_user)
    cookies.delete(:remember_token)
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end
end
