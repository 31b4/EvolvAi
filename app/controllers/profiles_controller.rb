class ProfilesController < ApplicationController
  def profile
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_path(@profile) # Profile display page
    else
      # If the save fails, re-render the form
      render :profile
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :password)
  end
end
