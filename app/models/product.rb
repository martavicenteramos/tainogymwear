class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :colour
  belongs_to :cut
  has_many :wishlists
  has_many :product_styles
  has_many :styles, through: :product_styles
  has_many :pictures

  validates :product_type, presence: true
  validates :price_cents, presence: true
  # validates :image_url, presence: true

  monetize :price_cents

  include AlgoliaSearch

  algoliasearch do
    # Use all default configuration
    attribute :name
  end

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      cut: [:name],
      product_type: [:name],
      colour: [:name],
      styles: [:name]
    },
    using: {
      tsearch: { prefix: true, any_word: true }
    }
end
