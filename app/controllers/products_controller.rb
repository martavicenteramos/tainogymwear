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

  def calculate_fav(products)
    colour = {Black: 0, Pastel: 0,Bright: 0,Neutral: 0}
    cut = {Tight: 0, Loose: 0}
    type = {Sports_Bra: 0 , Leggings: 0, Crop_Top: 0, T_shirt: 0, Shorts: 0, Hoodie: 0}
    products.each |product|
      colour[product.colour.name.to_sym] += 1
      cut[product.cut.name.to_sym] += 1
      type[product.product_type.name.gsub(/\s+/,"_").to_sym] += 1

    end
  end

end
