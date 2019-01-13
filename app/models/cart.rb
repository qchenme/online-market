class Cart < ApplicationRecord
  has_many :cart_item,
  # When cart is destroyed, its cart items would be destroyed too
  dependent: :destroy
end
