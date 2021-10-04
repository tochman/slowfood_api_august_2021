class Api::CartsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart.cart_products.create(product_id: product.id)
    cart.persisted?
    render json: {
      message: 'This product was added to your cart!',
      cart: {
        id: cart.id,
        products: cart.products
      }
    }, status: 201
  rescue StandardError
    render json: { message: 'Something went wrong!' }, status: 422
  end
end
