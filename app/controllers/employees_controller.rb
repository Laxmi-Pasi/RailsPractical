class EmployeesController < ApplicationController
  
  def index
    @employees=Employee.all
    if params[:search]
      if Employee.find_by("email = ?",params[:search])
        flash[:notice]="Email is present"
      else
        flash[:notice]="Email is not present"
      end
    end
  end

  def save
    puts :email
  end

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.find_or_create_by(employee_params)
    if employee.valid?
      flash[:notice] = "Employee is successfully added."
      redirect_to employee_path(employee[:id])
    else
      flash[:errors] = employee.errors.full_messages
      redirect_to new_employee_path(employee)
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path(@employee)
    end
  end

  def viewEmployeeSummary
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age,:no_of_order,:full_time_available,:salary)
  end
end
