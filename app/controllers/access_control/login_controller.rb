module AccessControl
  class LoginController < ApplicationController
    def login
      @user = AccessControl::User.new
    end

    def create
      user = AccessControl::User.find_by('LOWER(email) = ?', params[:email].downcase)

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :login, status: :unprocessable_entity
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully!'
    end
  end
end
