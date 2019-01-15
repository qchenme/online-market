module Mutations
  class PurchaseProduct <  Mutations::BaseMutation
    null true

    argument :id, ID, required: true
    argument :amount, Int, required: false, default_value: 1

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(id:, amount:)
      product = Product.find(id)

      # Validate:
      # (1) inventory_count > 0
      # (2) amount <= inventory_count
      if product.inventory_count <= 0
        raise GraphQL::ExecutionError, "The product with id #{product.id} is out of stock."
      end
      if product.inventory_count < amount
        raise GraphQL::ExecutionError, "Unable to buy #{amount} because the product only have #{product.inventory_count} left."
      end

      newCount = product.inventory_count-amount
      if product.update(inventory_count: newCount)
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