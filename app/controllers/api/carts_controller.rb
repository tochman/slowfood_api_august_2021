class Api::CartsController < ApplicationController
  def show
    carts = Cart.all
    render json: { carts: carts}
  end
end
