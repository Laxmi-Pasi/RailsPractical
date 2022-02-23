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
    @product = Myproduct.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to myproduct_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to myproduct_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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
