module Mutations
  class DeleteCartItem <  Mutations::BaseMutation
    null true

    argument :id, String, required: true

    field :cart_item, Types::CartItemType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      cart_item = CartItem.find(id)
      cart = Cart.find(cart_item.cart_id)

      newTotalVal = cart.total_value - cart_item.product.price * cart_item.quantity
      if cart_item.destroy && cart.update(total_value: newTotalVal)
        {
          cart_item: cart_item,
          errors: [],
        }
      else
        {
          cart_item: nil,
          errors: cart_item.errors.full_messages
        }
      end
    end

  end
end