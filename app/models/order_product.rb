class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product, :order, :quantity, :size, :order_id, presence: true
end
