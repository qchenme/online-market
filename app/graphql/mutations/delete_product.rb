module Mutations
  class DeleteProduct <  Mutations::BaseMutation
    null true

    argument :id, ID, required: true

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      product = Product.find(id)
      product.destroy

      {
        product: product,
        errors: []
      }
    end
  end
end