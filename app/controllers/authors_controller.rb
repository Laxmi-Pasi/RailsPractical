class AuthorsController < ApplicationController
  before_action :current_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    a = Author.create(author_params)
    redirect_to authors_path
  end

  def edit
  end

  def update
    @author.update(author_params)
    redirect_to authors_path
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :dob, :email)
  end

  def current_author
    @author = Author.find(params[:id])
  end
end
