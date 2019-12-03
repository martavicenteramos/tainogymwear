class UsersController < ApplicationController
  def show
    authorize current_user
  end

  def edit
  end

  def update
    authorize current_user

    if current_user.update(user_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(
      :cut_id, style_ids: [], product_type_ids: [], colour_ids: []
    )
  end
end
