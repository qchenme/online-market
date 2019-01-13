module Types
  class CartType < Types::BaseObject  
    graphql_name "Cart"
    description "Cart object contains all information of a cart"

    field :id, ID, "Unique id of the cart", null: false
    field :total_value, Float, "Total price of items in the cart", null: false
    field :is_completed, Boolean, "The status of the cart", null: false
    field :cart_item, [Types::CartItemType], "All items in the cart", null: false
  end
end
