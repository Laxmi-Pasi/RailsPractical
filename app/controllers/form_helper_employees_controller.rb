class FormHelperEmployeesController < ApplicationController
  def index
    @employees=FormHelperEmployee.all
  end
  
  def new
    @employee =FormHelperEmployee.new
    2.times { @employee.emp_addresses.build }
  end

  def create
    employee = FormHelperEmployee.create(employee_params)
    if employee.valid?
      flash[:notice] = "Employee is successfully added."
      redirect_to form_helper_employee_path(employee)
    else
      flash[:errors] = employee.errors.full_messages
      redirect_to new_form_helper_employee_path(employee)
    end
  end

  def edit
    @employee = FormHelperEmployee.find(params[:id])
  end

  def update
    @employee = FormHelperEmployee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee is successfully updated."
      redirect_to form_helper_employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_form_helper_employee_path(@employee)
    end
  end

  def show
    @employee = FormHelperEmployee.find(params[:id])
  end

  def destroy
    @employee = FormHelperEmployee.find(params[:id])
    @employee.destroy
    redirect_to form_helper_employees_path
  end

  def employee_params
    params.require(:form_helper_employee).permit(:employee_name, :email, :password,
     :birth_date,:document,{hobbies:[]},:gender,:mobile_number,:address,
     emp_addresses_attributes: [:house_name, :street_name, :road])
  end

  def search
    if params[:query]
      redirect_to search_path if FormHelperEmployee.find(params[:query]).blank?
      redirect_to form_helper_employee_path(params[:query])
    end
  end
end
