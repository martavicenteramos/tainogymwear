class ProductStyle < ApplicationRecord
  belongs_to :style
  belongs_to :product

  validates :style_id, :product_id, presence: true
  validates_uniqueness_of :product_id, :scope => [:style_id]
end
