class ItemController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @chosen_product = Product.find(params[:id])
    render json: @chosen_product
  end

  def new
    @new_product = Product.new(product_params)
    @new_product.save
    render json: @new_product
  end

  def edit
    @product = Product.find(params[:id])
  end

  def delete
    Product.find(params[:id]).destroy
    render json: @products
  end

  def product_params
    params.permit(:name, :price, :quantity, :number_of_people_sharing)
  end
end
