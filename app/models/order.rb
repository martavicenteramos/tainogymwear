class Order < ApplicationRecord
  belongs_to :user_id

  validates :total_value, :date, :status, :address, presence: true
end
