class MyordersController < ApplicationController
  before_action :store_product_id
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = @product.myorders
  end

  def show
  end

  def new
    @order = @product.myorders.build
  end

  def edit
  end

  def create
    @order = @product.myorders.create(order_params)
    if @order.valid?
      flash[:notice] = "Order is successfully added."
      redirect_to myproduct_myorder_path(@product,@order)
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to new_myproduct_myorder_path(@product)
    end
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Order is successfully updated."
      redirect_to myproduct_myorder_path(@product)
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to edit_myproduct_myorder_path(@product)
    end
  end

  def destroy
    @order.destroy
    redirect_to myproduct_myorders_path
  end

  private
    def order_params
      params.require(:myorder).permit(:quantity, :total_price, :myproduct_id)
    end

    def set_order
      @order = @product.myorders.find(params[:id])
    end

    def store_product_id
      @product =Myproduct.find(params[:myproduct_id])
    end
end
