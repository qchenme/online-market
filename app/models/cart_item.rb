class CartItem < ApplicationRecord
  self.primary_key = :id
  belongs_to :cart, validate: true
  belongs_to :product, validate: true
end
