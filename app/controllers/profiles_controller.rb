class ProfilesController < ApplicationController

  def show
    @user = current_user
    authorize @user
  end

  def update
    # ...

    #redirect_to profile_path
  end

end
