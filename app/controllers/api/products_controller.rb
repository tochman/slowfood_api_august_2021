class Api::ProductsController < ApplicationController
  def index
    # category = params[:category] || 'all'
    products = Product.send((params[:category] || 'all').to_sym)
    render json: { products: products }
  end
  # def show
  #   # product = Product.find(params[:id])
  #   products = Product.where(category: params[:id])
  #   render json: { products: products }
  # end
end

# As an API
# In order to provide my clients with information about specific categories on the menu
# I would like to provide an way to return all products in a specific category
