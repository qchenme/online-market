module Mutations
  class CreateProduct <  Mutations::BaseMutation
    null true

    argument :title, String, required: true
    argument :price, Float, required: true
    argument :inventory_count, Int, required: false, default_value: 0

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(title:, price:, inventory_count: nil)
      product = Product.new(title: title, price: price,   inventory_count: inventory_count)
      if product.save
        {
          product: product,
          errors: [],
        }
      else
        {
          product: nil,
          errors: product.errors.full_messages
        }
      end
    end

  end
end