class UserStylesController < ApplicationController
  def new
    @user_style = UserStyle.new
    authorize @user_style
  end

  def create
    @user = current_user

    @user_style = UserStyle.new(style_id: params[:user_style][:style])

    authorize @user_style
    @user_style.user = @user
    @user_style.save
    redirect_to users_path
  end

  private

  def style_params
    params.require(:user_style).permit(:style)
  end
end
