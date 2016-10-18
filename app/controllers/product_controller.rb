class ProductController < ApplicationController
  def list
    @products = Product.all
    render json: @products
  end

  def show
    @chosen_product = Product.find(params[:id])
    render json: @chosen_product
  end

  def new
    @new_product = Product.new(product_params)
    if @new_product.valid?
      @new_product.save
      render json: @new_product
    else
      render json: @new_product.errors, status: 400
    end
  end

  def edit
    @product_edited = Product.find(params[:id])
    @product_edited.update(product_params)

    if @product_edited.valid?
      @product_edited.save
      render json: @product_edited
    else
      render json: @product_edited.errors, status: 400
    end
  end

  def delete
    Product.find(params[:id]).destroy
    render json: @products
  end

  def product_params
    params.permit(:id, :name, :price, :quantity, :number_of_people_sharing)
  end
end
