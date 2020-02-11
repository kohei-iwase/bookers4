class UsersController < ApplicationController
before_action :authenticate_user!
#before_action :correct_user, only: [:edit, :update]
  def show
  	@user = User.find(params[:id])
    @books =@user.books.reverse_order
    @book =Book.new
   end
  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to "/users/2"
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user),notice: "update successfully"
    else
    render :edit,notice: "update error"
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
 end
