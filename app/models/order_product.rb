class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product, :quantity, :size, presence: true
end
