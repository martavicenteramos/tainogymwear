class WishlistsController < ApplicationController
  # before_action :set_product, only: :destroy

  def index
    @wishlists = policy_scope(Wishlist).where(user_id: current_user.id)
  end

  def new
    @wishlist = Wishlist.new
    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.product = Product.find(params["product_id"].to_i)
    @wishlist.user = current_user
    authorize @wishlist
    if @wishlist.save
      redirect_to wishlists_index_path, notice: 'Your item was added to Wishlist.'
    else
      redirect_to wishlists_index_path, notice: 'This item is already in your wishlist'
    end
  end

  def show
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
    @wishlist.destroy
    redirect_to wishlists_index_path, notice: 'The item was removed from your Wishlist'
  end

  private

  # def set_product
  #   @product = Product.find(params[:product_id])
  # end

  def wishlist_params
    params.require(:wishlist).permit(:product, :user_id)
  end
end
