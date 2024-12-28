class ProfileController < ApplicationController

  def profile
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      puts @profile.errors.full_messages
      render :profile
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :password)
  end
end
