class UserStyle < ApplicationRecord
  belongs_to :style
  belongs_to :user

  validates :style, :user, presence: true
end
