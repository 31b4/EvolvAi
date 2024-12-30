class ProfilesController < ApplicationController
  def profile
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    
    if @profile.save
      redirect_to login_path, notice: 'Registration successful! Please login.'
    else
      render :profile, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :password)
  end
end
