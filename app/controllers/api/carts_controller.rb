class Api::CartsController < ApplicationController
  before_action :authenticate_user!, only: :create
  rescue_from ActiveRecord::RecordNotFound, with: :custom_error

  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart.cart_products.create(product_id: product.id)
    is_cart_valid(cart, cart, 201)
  end

  private

  def custom_error
    render json: { message: 'Unauthorized request!' }, status: 422
  end

  def is_cart_valid(checking, cart, status)
    if checking.persisted?

      render json: {
        message: 'This product was added to your cart!',
        cart: {
          id: cart.id,
          products: cart.products
        }
      }, status: status
    else
      custom_error
    end
  end
end
