class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true

  validates :product, :quantity, :size, presence: true
end
