module Mutations
  class DeleteCart <  Mutations::BaseMutation
    null true

    argument :id, ID, required: true

    field :cart, Types::CartType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      cart = Cart.find(id)
      cart.destroy
      {
        cart: cart,
        errors: []
      }
    end
  end
end