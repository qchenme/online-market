module Types
  class ProductType < Types::BaseObject  
    graphql_name "Product"
    description "Product object contains all information of a product"

    field :id, ID, "Unique id of the product", null: false
    field :title, String, "Title of the product", null: false
    field :price, Float, "Price of the product", null: false
    field :inventory_count, Int, "Remaining stock of the product", null: false
  end
end
