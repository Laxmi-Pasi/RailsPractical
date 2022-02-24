class Business::MycustomersController < ApplicationController
  
  before_action :current_customer, only: [:preview, :edit, :update, :delete_customer]

  def index
    @customers=Mycustomer.all
  end

  def preview
  end

  def new
    @customer = Mycustomer.new
  end

  def create
    customer = Mycustomer.create(customer_params)
    if customer.valid?
      flash[:notice] = "Customer is successfully added."
      redirect_to preview_business_mycustomer_path(customer)
    else
      flash[:errors] = customer.errors.full_messages
      redirect_to new_business_mycustomers_path
    end
  end

  def edit
  end

  def update
    customer = @customer.update(customer_params)
    if customer
      flash[:notice] = "Customer is successfully updated."
      redirect_to preview_business_mycustomer_path(@customer)
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to edit_business_mycustomer_path(@customer)
    end
  end

  def delete_customer
    @customer.destroy
    redirect_to business_mycustomers_path
  end

  def search
    @customer=Mycustomer.find(params[:search])
  end

  private
  def current_customer
    @customer = Mycustomer.find(params[:id])
  end

  def customer_params
    params.require(:mycustomer).permit(:name, :email, :phone_number)
  end  
end
