class Api::CartsController < ApplicationController
  def show
    carts = Cart.all
    render json: { carts: carts }
  end

  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart_product = current_product
    # if session[:cart_id]
    #   cart = Cart.find_by(id: session[:cart_id])
    #   if cart.present?
    #     @current_cart = cart
    #   else
    #     session[:cart_id] = nil
    #   end
    # end

    # if session[:cart_id].nil?

    #   @current_cart = Cart.create # (name: Product.first[:name], unit_price: Product.first[:price])

    #   session[:cart_id] = @current_cart
    # end
  end
end
