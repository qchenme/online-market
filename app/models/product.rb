class Product < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :price, presence: true
end
