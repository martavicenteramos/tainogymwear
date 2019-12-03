class WishlistsController < ApplicationController
  # before_action :set_product, only: :create

  def index
    @wishlists = policy_scope(Wishlist).where(user_id: current_user.id)
  end

  def new
    @wishlist = Wishlist.new
    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.create(wishlist_params)
    @wishlist.product = Product.find(params["wishlist"]["product_id"])
    @wishlist.user = current_user
    authorize @wishlist
    if @wishlist.save
      redirect_to wishlists_path, notice: 'Your item was added to Wishlist.'
    else
      redirect_to "/", notice: 'There is a problem in add this item to your Wishlist'
    end
  end

  def show
  end

  private

  # def set_product
  #   @product = Product.find(params[:product_id])
  # end

  def wishlist_params
    params.require(:wishlist).permit(:product_id, :user_id)
  end
end
