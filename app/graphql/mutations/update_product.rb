module Mutations
  class UpdateProduct <  Mutations::BaseMutation
    null true

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :price, Float, required: false
    argument :inventory_count, Int, required: false

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(id:, title: nil, price: nil, inventory_count: nil)
      product = Product.find(id)

      title = product.title unless title
      price = product.price unless price
      inventory_count = product.inventory_count unless inventory_count
      
      # TODO: handle inventory_count < 0 exception
      
      if product.update(title: title, price: price, inventory_count: inventory_count)
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