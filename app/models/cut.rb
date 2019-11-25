class Cut < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[tight loose] }
end
