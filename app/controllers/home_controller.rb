class HomeController < ApplicationController
  def index
    @current_user = current_user
    if @current_user
      render 'home/index'
    else
      redirect_to login_path, notice: 'Please log in to continue'
    end
  end

  private

  def current_user
    @current_user ||= AccessControl::User.find_by(id: session[:user_id])
  end
end
