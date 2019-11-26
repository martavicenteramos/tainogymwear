class ProductsController < ApplicationController
  before_action :set_user, only: [:index]
  def index
    @products = Products.all
    @user_products = @user.products
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
