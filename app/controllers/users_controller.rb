class UsersController < ApplicationController
  #before_action :correct_user, only: [:edit, :update]
  def show
  	@user = User.find(params[:id])
    @books =@user.books.reverse_order
    book = Book.find(params[:id])
    @book =Book.new
   end
  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user.id),notice: "update successfully"
    else
    render :edit
    end
  end
  def index
    @user = current_user
  	@users = User.all
    @book =Book.new
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image,:introduction)
  end
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end
end
