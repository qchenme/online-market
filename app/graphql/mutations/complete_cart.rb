module Mutations
  class CompleteCart < Mutations::BaseMutation
    null true

    argument :id, ID, required: true
    
    field :cart, Types::CartType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      cart = Cart.find(id)

      # Get all info from the products & quantity
      productinfo = Hash.new
      cart.cart_item.each do |item|
        remainCount = cart_item.product.inventory_count - item.quantity
        productinfo[item.product_id] = { inventory_count: remainCount }
      end
      
      if Product.update(productinfo.keys, productinfo.values) && cart.update(is_completed: true)
        {
          cart: cart,
          errors: [],
        }
      else
        {
          cart: nil,
          errors: cart.errors.full_messages
        }
      end
    end

  end
end