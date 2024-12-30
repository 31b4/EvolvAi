class AccessControl::LoginController < ApplicationController
  def login
    @user = AccessControl::User.new
  end

  def create
    user = AccessControl::User.find_by(email: params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end
