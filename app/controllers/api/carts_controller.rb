class Api::CartsController < ApplicationController
  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart.cart_products.create(product_id: product.id)
    if cart.persisted?
      render json: {
        message: 'This product was added to your cart!',
        cart: {
          id: cart.id,
          products: cart.products
        }
      }, status: 201
    else
      render json: { message: 'Something went wrong! ' }, status: 422
    end
  end
end
