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
    @order = @product.myorders.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to myproduct_myorders_path(@product), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to myproduct_myorder_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to myproduct_myorders_path, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
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
