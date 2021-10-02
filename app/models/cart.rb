class Cart < ApplicationRecord
  belongs_to :user
  has_many :products, through: :orders
  has_many :orders
end
