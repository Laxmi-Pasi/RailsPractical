class MyproductsController < ApplicationController
  
  before_action :set_product, only: %i[ show edit update destroy ]
  def index
    @products = Myproduct.all
  end

  def show
  end

  def new
    @product = Myproduct.new
  end

  def edit
  end

  def create
    @product = Myproduct.create(product_params)
    if @product.valid?
      flash[:notice] = "Product is successfully added."
      redirect_to myproduct_path(@product)
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to new_myproduct_path
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product is successfully updated."
      redirect_to myproduct_path(@product)
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_myproduct_path(@product)
    end
  end

  def destroy
    @product.destroy
    redirect_to myproducts_path
  end

  private
  def set_product
    @product = Myproduct.find(params[:id])
  end

  def product_params
    params.require(:myproduct).permit(:name, :price, :description)
  end
  
end
