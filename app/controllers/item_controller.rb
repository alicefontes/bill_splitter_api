class ItemController < ApplicationController
  # before_action :new

  def index
    @products = Product.all
    render json: @products
  end

  def show_new_item
    @newProduct = Product.new(product_params)
    @newProduct.save
    render json: @newProduct
  end

  def product_params
    params.permit(:name, :price, :quantity, :number_of_people_sharing)
  end

  def destroy_all
    Product.all.destroy
      render json: @products
  end
end
