class UserStyle < ApplicationRecord
  belongs_to :style
  belongs_to :user

  validates :style, :user, presence: true
  validates_uniqueness_of :style_id, :scope => [:user_id, :enhanced]
end
