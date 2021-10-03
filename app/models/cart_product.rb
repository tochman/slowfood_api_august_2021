class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  has_many :products, through: :products

end
