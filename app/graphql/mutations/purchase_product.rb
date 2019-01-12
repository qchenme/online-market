module Mutations
  class PurchaseProduct <  Mutations::UpdateProduct
    null true

    argument :id, ID, required: true
    argument :amount, Int, required: false, default_value: 1

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(id:, amount:)
      product = Product.find(id)
      # TODO: Check amount <= inventory_count
      # TODO: Check inventory_count > 0
      newCount = product.inventory_count-amount

      # Call parent update method
      super(id: id, inventory_count: newCount)
    end
  end
end