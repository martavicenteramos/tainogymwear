class UserColour < ApplicationRecord
  belongs_to :colour
  belongs_to :user

  validates :colour, :user, presence: true
  validates_uniqueness_of :user_colour_id, :scope => [:user_id]
end
