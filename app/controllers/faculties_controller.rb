class FacultiesController < ApplicationController
  def index
    @faculties=Faculty.all
  end

  def new
    @faculty = Faculty.new
  end

  def create
    f= Faculty.create(faculty_params)
    if f.save
      redirect_to faculties_path
    else
      redirect_to new_faculty_path(@faculty)
    end
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    @faculty.update(faculty_params)
    redirect_to faculties_path
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    redirect_to faculties_path
  end

  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :DOB, :designation,:email_id,:phone)
  end
end
