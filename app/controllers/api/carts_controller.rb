class Api::CartsController < ApplicationController
  def show
    @cart = @current_cart
    carts = Cart.all
    render json: { carts: carts}
  end
end
