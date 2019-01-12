module Types
  class MutationType < Types::BaseObject
    description "Root mutation"
    
    field :create_product, mutation: Mutations::CreateProduct, description: "Add a new product"
    field :update_product, mutation: Mutations::UpdateProduct, description: "Update existing product information"
    field :purchase_product, mutation: Mutations::PurchaseProduct, description: "Purchase a product"
    field :delete_product, mutation: Mutations::DeleteProduct, description: "Delete a product"

  end
end
