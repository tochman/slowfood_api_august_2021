class Api::CartsController < ApplicationController
  before_action :authenticate_user!, only: :create
  rescue_from ActiveRecord::RecordNotFound, with: :custom_error

  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart.cart_products.create(product_id: product.id)
    cart_is_valid(cart)
  end

  private

  def custom_error
    render json: { message: 'Product not found!' }, status: 422
  end

  def cart_is_valid(cart)
    render json: {
      message: 'This product was added to your cart!',
      cart: {
        id: cart.id,
        products: cart.products
      }
    }, status: 201
  end
end
