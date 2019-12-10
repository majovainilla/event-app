# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    if (user = User.find_by(name: params[:session][:name]))
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Not a valid user'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
