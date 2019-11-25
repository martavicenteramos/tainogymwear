class Style < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[shoulders belly arms waist legs glutes] }
end
