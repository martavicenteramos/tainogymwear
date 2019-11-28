class Style < ApplicationRecord
  has_many :product_styles
  has_many :products, through: :product_styles


  validates :name, presence: true, inclusion: { in: %w[Shoulders Belly Arms Waist Legs Glutes] }, uniqueness: true
end
