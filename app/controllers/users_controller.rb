class UsersController < ApplicationController

  def show
    @user = current_user
    authorize @user
  end

  def edit
  end

  def update
  end

  def create
  end
end
