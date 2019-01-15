## Installation

Clone repository to local
```sh
$ git clone 
```
Install dependencies
```sh
$ bundle install 
```
Setup database
```sh
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
Start the server
```sh
$ rails server
```
Open
```sh
$ open http://localhost:3000/
```

## Queries and Mutations

### Queries

| Name | Parameters | Description |
| ------ | ------ | ------ |
| allProducts | optional: onlyAvailable | Get all products, if onlyAvailable = true, return all products that are in stock.
| product | **id** | Get product with the id specified. |
| allCarts |  | Get all carts |
| cart | **id** | Get cart with the id specified. |
| cartItem | **id** | Get cart item with the id specified. |

### Mutations

| Name | Parameters | Description |
| ------ | ------ | ------ |
| createProduct | **title**, **price**, optional: inventoryCount(default = 0) | Create a new product with title and name specified. If no inventoryCount is passed, it will default to 0. |
| updateProduct | **id**, optional: title, optional:  price, optional:  inventoryCount | Update product information. |
| purchaseProduct | **id**, optional: amount(default = 1) | Purchase a product with any amount specified. If no amount is passed, it will default to 1. |
| deleteProduct | **id**| Delete a product |
| createCart |  | Create a new, empty cart. |
| completeCart | **id** | Purchase all the items in the cart. |
| deleteCart | **id** | Delete a cart. |
| addCartItem | **productId**, **cartId**, optional: quantity(default = 1) | Add product(s) to cart. |
| updateCartItem | **id**, **quantity** | Update cart item's quantity. |
| deleteCartItem | **id** | Delete a cart item from its cart. |

### Operation Samples

#### Queries
allProducts
```graphql
{
  allProducts{
    id
    title
    price
    inventoryCount
  }
}
```
allCarts
```graphql
{
  allCarts{
    id
    isCompleted
    totalValue
    cartItem{
      id
      quantity
      product{
        title
        price
        inventoryCount
      }
    }
  }
}
```

#### Mutations
completeCart
```graphql
mutation{
  completeCart(id: 3){
    cart{
      id
      totalValue
      isCompleted
      cartItem{
        product{
          title
          inventoryCount
        }
      }
    }
  }
}
```
deleteCartItem
```graphql
mutation{
  deleteCartItem(id: "3-4"){
    cartItem{
      quantity
    }
  }
}
```
addCartItem
```graphql
mutation{
  addCartItem(productId: 3, cartId: 1, quantity: 10){
    cartItem{
      id
      quantity
       product{
        title
        id
        inventoryCount
      }
    }
  }
}
```
purchaseProduct
```graphql
mutation{
  purchaseProduct(id: 2){
    product{
      id
      title
      inventoryCount
    }
  }
}
```
