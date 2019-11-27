class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :cut, optional: true
  has_many :orders
  has_many :order_products, through: :orders
  has_many :products, through: :orders

  def find_or_create_pending_order
    order = orders.where(status: "pending")
    if order.any?
      order.first
    else
      Order.create(user: self, status: "pending")
    end
  end
end
