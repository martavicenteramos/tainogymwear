class ProductsController < ApplicationController
  before_action :check_user_questionaire, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show]

  def index
  end

  def show
    authorize @product
    @order_product = OrderProduct.new
  end

  private

  def check_user_questionaire
    if session[:questionaire].nil?
      @products = policy_scope(Product).order(created_at: :desc)
    else
      # TODO mostrar produtos especificos depois de respondido o questonario
      @products = policy_scope(Product).order(created_at: :desc)
      @user_products = current_user.products
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
