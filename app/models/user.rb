class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :cut, optional: true
  has_many :orders
  has_many :order_products, through: :orders
  has_many :products, through: :orders
  has_many :user_colours
  has_many :colours, through: :user_colours
  has_many :user_styles
  has_many :styles, through: :user_styles
  has_many :user_product_types
  has_many :product_types, through: :user_product_types
  has_many :wishlists, dependent: :destroy

  def find_or_create_pending_order
    order = orders.where(status: "pending")
    if order.any?
      order.first
    else
      Order.create(user: self, status: "pending")
    end
  end
end
