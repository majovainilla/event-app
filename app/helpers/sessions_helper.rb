# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    user.remember
    session[:name] = user.name
    # cookies.permanent[:remember_token] = user.remember_token
    current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:name)
    # cookies.permanent[:remember_token] = nil
    @current_user = nil
  end

  def forget(user)
    user.forget_token
    # cookies.delete(:user_id)
    # cookies.delete(:remember_token)
  end

  def current_user
    @current_user ||= User.find_by(name: session[:name])
  end
end
