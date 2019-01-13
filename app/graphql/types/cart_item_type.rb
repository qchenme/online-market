module Types
  class CartItemType < Types::BaseObject  
    graphql_name "CartItem"
    description "Cart item object contains all information of an item that's added to a cart"

    field :id, ID, "Unique id of the item", null: false
    field :quantity, Int, "How many items has been added to the cart", null: false
    field :cart, Types::CartType, "Reference to the cart", null: false
    field :product, Types::ProductType, "Reference to the product", null: false
  end
end
