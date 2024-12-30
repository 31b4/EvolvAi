module AccessControl
  class LoginController < ApplicationController
    def login
      @user = User.new
    end

    def create
      # Megkeressük a felhasználót az email cím alapján
      user = User.find_by(email: params[:login][:email])

      # Ha megtaláltuk és az autentikáció sikeres, beléptetjük
      if user && user.authenticate(params[:login][:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :login
      end
    end

    def destroy
      # Kiléptetjük a felhasználót a session törlésével
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully!'
    end
  end
end
