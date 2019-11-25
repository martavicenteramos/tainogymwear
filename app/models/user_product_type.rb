class UserProductType < ApplicationRecord
  belongs_to :product_type
  belongs_to :user

  validates :product_type, :user, presence: true
end
