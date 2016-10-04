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

    attributes = {
      :name => params[:name],
      :price => params[:price],
      :quantity => params[:quantity],
      :number_of_people_sharing => params[:number_of_people_sharing]
    }
    attributes = attributes.delete_if { |_,v| v.nil? }

    @product_edited.update(attributes)
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
