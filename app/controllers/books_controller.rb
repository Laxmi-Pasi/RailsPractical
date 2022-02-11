class BooksController < ApplicationController

  def index
    @books=Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    b = Book.create(book_params)
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
    # if @book.update_with_conflict_validation(book_params)
    #   redirect_to books_path
    # else
    #   render :edit
    # end
  end

  def destroy
    @book = Book.find(params[:id])
<<<<<<< HEAD
    @book.destroy
=======
    @book.destroy=
>>>>>>> d624882100b8bd72346d3bce20bac6fb96d2a722
    redirect_to books_path
  end

  def book_params
<<<<<<< HEAD
      params.require(:book).permit(:name, :price, :author_id)
  end
=======
    params.require(:book).permit(:name, :price, :author_id)
  end 
>>>>>>> d624882100b8bd72346d3bce20bac6fb96d2a722
end
