class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true

  validates :product, :quantity, :size, :order_id, presence: true
end
