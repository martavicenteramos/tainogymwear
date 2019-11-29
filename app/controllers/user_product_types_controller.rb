class UserProductTypesController < ApplicationController
 def new
    @user_product_type = UserProductType.new
    authorize @user_style
  end

  def create
    @user = current_user

    @user_product_type = UserProductType.new(product_type_id: params[:user_product_type][:product_type])

    authorize @user_product_type
    @user_product_type.user = @user
    @user_product_type.save
    redirect_to users_path
  end

  private

  def style_params
    params.require(:user_product_type).permit(:product_type)
  end
end
