class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @products = Product.all
  end

  def users
  end

  def questionaire
  end

  def about_us
  end
end
