module Types
  class QueryType < Types::BaseObject
    description "Root query"

    # Fetch all products or all in stocked products depending on the optional boolean argument
    field :allProducts, [ProductType], null: false do
      description "Get all (or only in stocked) products"
      argument :only_available, Boolean, required: false
    end
    
    # Fetch product with specified id
    field :product, ProductType, null: true do
      description "Get the specified product by its id"
      argument :id, ID, required: true
    end

    # Fetch all carts
    field :allCarts, [CartType], null: true do
      description "Get all carts"
    end

    # Fetch cart with specified id
    field :cart, CartType, null: true do
      description "Get the specified cart by its id"
      argument :id, ID, required: true
    end

    # Fetch cart item with specified id
    field :cart_item, CartItemType, null: true do
      description "Get the specified cart item by its id"
      argument :id, ID, required: true
    end

    # Query functions
    def all_products(only_available: nil)
      if only_available
        Product.where("inventory_count > ?", 0)
      else
        Product.all
      end
    end

    def product(id:)
      Product.find(id)
    end

    def all_carts()
      Cart.all()
    end

    def cart(id:)
      Cart.find(id)
    end

    def cart_item(id:)
      CartItem.find(id)
    end
  end
end
