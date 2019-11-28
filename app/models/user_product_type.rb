class UserProductType < ApplicationRecord
  belongs_to :product_type
  belongs_to :user

  validates :product_type, :user, presence: true
  validates_uniqueness_of :product_type_id, :scope => [:user_id]
end
