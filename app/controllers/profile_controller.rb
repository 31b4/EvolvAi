class ProfileController < ApplicationController
  def profile
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if Profile.exists?(email: @profile.email)
      flash[:alert] = "This email address is already registered!"
      render :user
    else
      if @profile.save
        redirect_to @profile
      else
        render :user
      end
    end
  end
  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :password)
  end
end
