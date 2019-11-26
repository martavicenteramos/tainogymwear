class Style < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[Shoulders Belly Arms Waist Legs Glutes] }, uniqueness: true
end
