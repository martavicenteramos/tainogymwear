class Cut < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[Tight Loose] }
end
