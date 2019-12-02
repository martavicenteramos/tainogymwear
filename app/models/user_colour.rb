class UserColour < ApplicationRecord
  belongs_to :colour
  belongs_to :user

  validates :colour, :user, presence: true
  validates_uniqueness_of :colour_id, :scope => [:user_id]
end
