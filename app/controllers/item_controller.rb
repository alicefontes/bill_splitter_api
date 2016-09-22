class ItemController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    chosen_product = Product.find(params[:id])
    render json: chosen_product
  end

  def new
    newProduct = Product.new(product_params)
    newProduct.save
    render json: newProduct
  end

  # def edit
  #   chosen_product = Product.find(params[:id])
  #
  # end

  def delete
    Product.find(params[:id]).destroy
    render json: @products
  end

  def product_params
    params.permit(:name, :price, :quantity, :number_of_people_sharing)
  end
end
