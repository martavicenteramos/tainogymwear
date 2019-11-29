class UsersController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @user_style = UserStyle.new
    @cut = Cut.new
    @user_colour = UserColour.new
    @user_product_type = UserProductType.new
  end

  def edit
  end

  def update
  end

  def create
  end
end
