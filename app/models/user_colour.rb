class UserColour < ApplicationRecord
  belongs_to :colour
  belongs_to :user

  validates :colour, :user, presence: true
end
