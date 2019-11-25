class Colour < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[bright neutral pastel stamps] }
end
