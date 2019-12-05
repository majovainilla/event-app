# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      flash[:success] = 'User created'
      redirect_to user_path
    end
  end

  def show
    @user.name
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
