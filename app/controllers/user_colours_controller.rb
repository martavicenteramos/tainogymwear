class UserColoursController < ApplicationController
  def new
    @user_colour = UserColour.new
    authorize @user_colour
  end

  def create
    @user = current_user
    @user_colour = UserColour.new(colour_id: params[:user_colour][:colour])
    authorize @user_colour
    @user_colour.user = @user
    @user_colour.save
    redirect_to users_path
  end

  private

  def colour_params
    params.require(:user_colour).permit(:colour)
  end
end
