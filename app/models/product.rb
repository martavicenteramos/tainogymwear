class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :colour
  belongs_to :cut

  validates :product_type, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
end
