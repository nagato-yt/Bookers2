class BooksController < ApplicationController
  def new
    @book= Book.new
  end

  def show
  @book=Book.find(params[:id])
  end

  def index
    @books =Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:notice]= "Book was successfully destroyed!"
    redirect_to '/books'
  end

  def create
    @books=Book.all
    @book =Book.new(book_params)
    @book.user_id= current_user.id
    @book.save
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.permit(:title,:body,:image)
  end 
  
end
