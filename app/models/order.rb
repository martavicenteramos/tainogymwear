class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :order_products
  has_many :order_products

  validates :status, presence: true
  monetize :total_value_cents
end
