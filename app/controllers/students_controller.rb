class StudentsController < ApplicationController
  def index
    @students=Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)
    if student.valid?
      flash[:notice] = "Student is successfully added."
      redirect_to student_path(student[:id])
    else
      flash[:errors] = student.errors.full_messages
      redirect_to new_student_path(student)
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :DOB, :department,:terms_of_service)
  end
end
