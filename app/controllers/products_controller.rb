class ProductsController < ApplicationController
  before_action :check_user_questionaire, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all

    # @recomended shows products based on other user similarities
    if current_user.present?
      @recomended = Recommended.new.recomend_products(current_user)
      @user_best_match = Recommended.new.calculate_questions(current_user)
      @products = @user_best_match + @recomended + @products
      @products = @products.map{|t| t}.uniq
    end

    if params[:query].present?
      @products = Product.all
      @filter = params[:query]
      @products = @products.global_search(@filter[:cut]) if @filter[:cut].present?
      @products = @products.global_search(@filter[:colour]) if @filter[:colour].present?
      @products = @products.global_search(@filter[:style]) if @filter[:style].present?
      @products = @products.global_search(@filter[:type]) if @filter[:type].present?
    end
  end

  def show
    authorize @product
    @order_product = OrderProduct.new
  end

  private

  # # Calculates number of properties from products user bought
  # def calculate_orders(products)
  #   colour = { Black: 0, Pastel: 0, Bright: 0, Neutral: 0 }
  #   cut = { Tight: 0, Loose: 0 }
  #   type = { Sports_Bra: 0, Leggings: 0, Crop_Top: 0, T_shirt: 0, Shorts: 0, Hoodie: 0 }
  #   style = { Shoulders: 0, Belly: 0, Arms: 0, Waist: 0, Legs: 0, Glutes: 0 }
  #   products.each do |product|
  #     colour[product.colour.name.to_sym] += 1
  #     cut[product.cut.name.to_sym] += 1
  #     type[product.product_type.name.gsub(/\s+|-/, "_").to_sym] += 1
  #     styles = product.styles
  #     styles.each do |sty|
  #       style[sty.name.to_sym] += 1
  #     end
  #   end

  #   colour = colour.sort_by { |_k, v| v }.reverse
  #   cut = cut.sort_by { |_k, v| v }.reverse
  #   type = type.sort_by { |_k, v| v }.reverse
  #   style = style.sort_by { |_k, v| v }.reverse
  #   return [colour, cut, type, style]
  # end



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
























