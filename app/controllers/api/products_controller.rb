class Api::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: { products: products }
  end
  def show
    products = Product.where(params["category"])
    render json: { products: products }
  end
end
