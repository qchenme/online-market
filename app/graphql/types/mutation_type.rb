module Types
  class MutationType < Types::BaseObject
    description "Root mutation"
    
    field :create_product, mutation: Mutations::CreateProduct, description: "Add a new product"
    field :update_product, mutation: Mutations::UpdateProduct, description: "Update existing product information"
    field :purchase_product, mutation: Mutations::PurchaseProduct, description: "Purchase a product"
    field :delete_product, mutation: Mutations::DeleteProduct, description: "Delete a product"

    field :create_cart, mutation: Mutations::CreateCart, description: "Create a new cart"
    field :delete_cart, mutation: Mutations::DeleteCart, description: "Delete a cart"
    field :complete_cart, mutation: Mutations::CompleteCart, description: "Complete a cart"
    
    field :update_cart_item, mutation: Mutations::UpdateCartItem, description: "Update cart item quantity"
    field :add_cart_item, mutation: Mutations::AddCartItem, description: "Add product(s) to a cart"
    field :delete_cart_item, mutation: Mutations::DeleteCartItem, description: "Delete a cart item from cart"
  end
end
