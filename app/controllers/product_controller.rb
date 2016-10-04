class ProductController < ApplicationController
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
    @product_edited = Product.find(params[:id])
    # @product_edited.update_attributes(params[:name], params[:price], params[:quantity], params[:number_of_people_sharing])
    unless params[:name].nil?
      @product_edited.name = params[:name]
    end
    unless params[:price].nil?
      @product_edited.price = params[:price]
    end
    unless params[:quantity].nil?
      @product_edited.quantity = params[:quantity]
    end
    unless params[:number_of_people_sharing].nil?
      @product_edited.number_of_people_sharing = params[:number_of_people_sharing]
    end
    @product_edited.save
    render json: @product_edited
  end

  def delete
    Product.find(params[:id]).destroy
    render json: @products
  end

  def product_params
    params.require(:price)
    params.require(:quantity)
    params.permit(:id, :name, :price, :quantity, :number_of_people_sharing)
  end
end
