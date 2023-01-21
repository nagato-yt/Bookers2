class BooksController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @book=Book.new
  end

  def create
    # @books=Book.all
    @book=Book.new(book_params)
    @book.user_id=current_user.id
     if @book.save
       flash[:notice]= "you have successfully completed."
       redirect_to book_path(@book.id)
     else
       render :index
     end 
  end
  
  def show
  @bookuser=Book.find(params[:id])
  @books=Book.all
  @book=Book.new
  @book_user=Book.find(params[:id]).user
  
  end

  def index
    @books =Book.all
    @book=Book.new
    @book_user=current_user
   
  end

  def edit
   @book = Book.find(params[:id])
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice]= "you have successfully completed !"
       redirect_to book_path(@book.id)
    else
      render :edit
    end 
  end 
  
  
private
  
  def book_params
    params.require(:book) .permit(:title,:body)
  end 
  
  
  def is_matching_login_user
  user_id= @book
  unless user_id ==current_user.id
    redirect_to books_path
  end 
  end
  
end
