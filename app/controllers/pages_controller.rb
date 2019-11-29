class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def users
    @user = current_user
    @user_style = UserStyle.new
    @cut = Cut.new
    @user_colour = UserColour.new
    @user_product_type = UserProductType.new
    @colours = Colour.all
    @styles = Style.all
    @types = ProductType.all

  end

  def questionaire
  end

end
