class Api::CartsController < ApplicationController
  before_action :authenticate_user!, only: :create
  rescue_from ActiveRecord::RecordNotFound, with: :custom_error

  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart.cart_products.create(product_id: product.id)
    render_response(cart, product, 201)
  end

  def update
    new_product = Product.find(params['product_id'])
    # binding.pry
    cart = current_user.carts.update(cart)
    cart.cart_products.create(product_id: new_product.id)
    
    render_response(cart, product, 200)
  end

  private

  def custom_error
    render json: { message: 'Product not found!' }, status: 422
  end

  def render_response(cart, product, status)
    render json: {
      message: "#{product.name} was added to your cart!",
      cart: {
        id: cart.id,
        products: cart.products
      }
    }, status: status
  end
end
