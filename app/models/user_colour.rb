class UserColour < ApplicationRecord
  belongs_to :color
  belongs_to :user

  validates :color, :user, presence: true
end
