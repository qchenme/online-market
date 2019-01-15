module Mutations
  class UpdateCartItem <  Mutations::BaseMutation
    null true

    argument :id, String, required: true
    argument :quantity, Int, required: true

    field :cart_item, Types::CartItemType, null: true
    field :errors, [String], null: false

    def resolve(id:, quantity:)
      cart_item = CartItem.find(id)
      cart = Cart.find(id)

      if cart_item.product.inventory_count < quantity
        raise GraphQL::ExecutionError, "Unable to add more products to the cart due to limited stock #{cart_item.product.inventory_count}."
      end

      # For updating cart totalvalue
      newTotalVal = cart.total_value - cart_item.product.price * cart_item.quantity + cart_item.product.price * quantity
      # Update quantity field in cart item
      if cart_item.update(quantity: quantity) && cart.update(total_value: newTotalVal)
        {
          cart_item: cart_item,
          errors: [],
        }
      else
        {
          cart_item: nil,
          errors: cart.errors.full_messages
        }
      end

    end

  end
end