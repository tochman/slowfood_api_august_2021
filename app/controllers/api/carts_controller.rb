class Api::CartsController < ApplicationController
  def show
    @cart = @current_cart
    carts = Cart.all
    current_cart
    render json: { carts: carts}
  end
end
