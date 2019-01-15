module Mutations
  class AddCartItem <  Mutations::BaseMutation
    null true

    argument :product_id, ID, required: true
    argument :cart_id, ID, required: true
    argument :quantity, Int, required: false, default_value: 1

    field :cart_item, Types::CartItemType, null: true
    field :errors, [String], null: false

    def resolve(product_id:, cart_id:, quantity:)
      cart = Cart.find(cart_id)
      product = Product.find(product_id)

      # Validate if the same item has been added to the cart previously
      item = CartItem.find_by_id("#{cart_id}-#{product_id}")
      if item
        update_item(cart, product, item, quantity)
      else
        new_item(cart, product, quantity)
      end
    end

    def new_item(cart, product, quantity)
       # Validate quantity < inventory_count
       if product.inventory_count < quantity
        raise GraphQL::ExecutionError, "Unable to add more products to the cart due to limited stock #{product.inventory_count}."
      end

      # For updating cart totalvalue
      newTotalVal = cart.total_value + product.price * quantity

      cart_item = CartItem.new(id: "#{cart.id}-#{product.id}", product_id: product.id, cart_id: cart.id, quantity: quantity)
      if cart_item.save && cart.update(total_value: newTotalVal)
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

    def update_item(cart, product, cart_item, quantity)
      # Validate quantity < inventory_count + previous count
      if product.inventory_count < quantity
        raise GraphQL::ExecutionError, "Unable to add more products to the cart due to limited stock #{product.inventory_count}."
      end

      # For updating cart totalvalue
      newTotalVal = cart.total_value + product.price * quantity
      # Update quantity field in cart item
      if cart_item.update(quantity: cart_item.quantity+quantity) && cart.update(total_value: newTotalVal)
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