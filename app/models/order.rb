class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products

  validates :total_value, :date, :status, :address, presence: true
end
