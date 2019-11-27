class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :cut, optional: true
  has_many :orders
  has_many :products, through: :orders
  has_many :user_colours
  has_many :colours, through: :user_colours
  has_many :user_styles
  has_many :styles, through: :user_styles
  has_many :user_product_types
  has_many :product_types, through: :user_product_types
end
