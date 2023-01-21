class UsersController < ApplicationController
  def edit
    @user =User.find(params[:id])
  end

  def show
    @book=Book.new
    @user= User.find(params[:id])
    @books= @user.books
  end
  
  def update
    @user= User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end 
  
  def index
    @users=User.all
    @book=Book.new
    
  end 
  

  private
  

  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end 
  
  def is_matching_login_user
  user_id= params[:id].to_i
  unless user_id ==current_user.id
    redirect_to books_path
  end 
  end 
end
