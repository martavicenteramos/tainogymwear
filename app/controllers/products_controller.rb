class ProductsController < ApplicationController
  before_action :check_user_questionaire, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
    @user = current_user
    if @user.products.present?
      @user_products = @user.products
      search = calculate_orders(@user_products)
      best_match(search)
    else
      search = calculate_questions(@user)
      best_match(search)
    # Use @best_products to populate the personalised index
  end

  def show
    authorize @product
    @order_product = OrderProduct.new
  end

  private

  # Calculates number of properties from products user bought
  def calculate_orders(products)
    colour = { Black: 0, Pastel: 0, Bright: 0, Neutral: 0 }
    cut = { Tight: 0, Loose: 0 }
    type = { Sports_Bra: 0, Leggings: 0, Crop_Top: 0, T_shirt: 0, Shorts: 0, Hoodie: 0 }
    style = { Shoulders: 0, Belly: 0, Arms: 0, Waist: 0, Legs: 0, Glutes: 0 }
    products.each do |product|
      colour[product.colour.name.to_sym] += 1
      cut[product.cut.name.to_sym] += 1
      type[product.product_type.name.gsub(/\s+|-/, "_").to_sym] += 1
      styles = product.styles
      styles.each do |sty|
        style[sty.name.to_sym] += 1
      end
    end
    colour = colour.sort_by { |_k, v| v }.reverse
    cut = cut.sort_by { |_k, v| v }.reverse
    type = type.sort_by { |_k, v| v }.reverse
    style = style.sort_by { |_k, v| v }.reverse
    return [colour, cut, type, style]
  end
  # Calculates number of properties from user questionaire
  def calculate_questions(user)
    colour = { Black: 0, Pastel: 0, Bright: 0, Neutral: 0 }
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
    #Sorts out in the decending order
    colour = colour.sort_by { |_k, v| v }.reverse
    cut = cut.sort_by { |_k, v| v }.reverse
    type = type.sort_by { |_k, v| v }.reverse
    style = style.sort_by { |_k, v| v }.reverse
    return [colour, cut, type, style]
  end

  def best_match(search)
    # Search is an array of hashes in this order
    # colour, cut, type, style
    # This function returns the best match search
    a = Colour.where(name: search[0].first[0])
    b = Cut.where(name: search[1].first[0])
    c = ProductType.where(name: search[2][0]) # Sports Bra doesnt work
    d = Style.where(name: search[3].first[0])

    @best_style = Style.where(name: d.first.name)[0].products
    @best_colour = @products.where(colour_id: a)
    @best_cut = @products.where(cut_id: b)
    @best_type = @products.where(product_type_id: c)

    #Returns the array of products
    @best_products = []
    @best_products << @best_style.where(colour_id: a).where(cut_id: b).where(product_type_id: c)
    @best_products << @best_style.where(colour_id: a).where(cut_id: b)
    @best_products << @best_style.where(colour_id: a)
    @best_products << @best_style.where(cut_id: b).where(product_type_id: c)
    @best_products << @best_style.where(cut_id: b)
    @best_products << @best_style.where(product_type_id: c)
    @best_products << @best_style.where(product_type_id: c).where(colour_id: a)
    @best_products << @best_style
    @best_products << @best_colour
    @best_products << @best_cut
    @best_products << @best_type
    @best_products = @best_products.uniq{|t| t.ids }

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




