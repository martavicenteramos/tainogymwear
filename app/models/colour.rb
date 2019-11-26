class Colour < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[Bright Neutral Pastel Stamps Black] }, uniqueness: true
end
