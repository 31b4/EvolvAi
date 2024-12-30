module AccessControl
  class RegisterController < ApplicationController
    def register
      @user = AccessControl::User.new
    end

    def create
      @user = AccessControl::User.new(user_params)

      if @user.save
        redirect_to login_path, notice: 'Registration successful! Please login.'
      else
        flash.now[:alert] = 'There was a problem with your registration. Please try again.'
        render :register, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
