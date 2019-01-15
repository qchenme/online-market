module Mutations
  class CreateCart <  Mutations::BaseMutation
    null true

    field :cart, Types::CartType, null: true
    field :errors, [String], null: false

    def resolve()
      cart = Cart.new(total_value: 0, is_completed: false)
      if cart.save
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