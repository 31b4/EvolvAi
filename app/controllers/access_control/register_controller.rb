module AccessControl
  class RegisterController < ApplicationController
    def register
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to access_control_login_path, notice: 'Registration successful! Please login.'
      else
        render :register, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:access_control_user).permit(:name, :email, :password)
    end

  end
end
