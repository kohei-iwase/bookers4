class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @books =@user.books.reverse_order
  	@book =Book.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
      @user = User.find(params[:id])
      @book.user_id = current_user.id
      if @book.save
      redirect_to books_path
        else
        render:index
        end
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end
  def index
  	@users = User.all
    @book =Book.new
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image_id ,:introduction)
  end
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
