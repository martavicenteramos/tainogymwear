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

  # Calculates number of properties from products user bought
  def calculate_orders(products)
    colour = { Black: 0, Pastel: 0, Bright: 0, Neutral: 0 }
    cut = { Tight: 0, Loose: 0 }
    type = { Sports_Bra: 0, Leggings: 0, Crop_Top: 0, T_shirt: 0, Shorts: 0, Hoodie: 0 }
    style = { Shoulders: 0, Belly: 0, Arms: 0, Waist: 0, Legs: 0, Glutes: 0 }
    products.each do|product|
      colour[product.colour.name.to_sym] += 1
      cut[product.cut.name.to_sym] += 1
      type[product.product_type.name.gsub(/\s+|-/, "_").to_sym] += 1
      styles = product.styles
      styles.each do |sty|
        style[sty.name.to_sym] += 1
      end
    end
    return [colour, cut, type, style]
  end
  # Calculates number of properties from user questionaire
  def calculate_questions(user)
    colour = { Black: 0, Pastel: 0, Bright: 0, Neutral: 0 }
    cut = { Tight: 0, Loose: 0 }
    type = { Sports_Bra: 0, Leggings: 0, Crop_Top: 0, T_shirt: 0, Shorts: 0, Hoodie: 0 }
    style = { Shoulders: 0, Belly: 0, Arms: 0, Waist: 0, Legs: 0, Glutes: 0 }
    user.styles.each do |user_sty|
      style[user_sty.name.to_sym] += 1
    end
    user.colours.each do |user_col|
      colour[user_col.name.to_sym] += 1
    end
    user.product_types.each do |user_prod|
      type[user_prod.name.gsub(/\s+|-/, "_").to_sym] += 1
    end
    return [colour, cut, type, style]
  end
end
