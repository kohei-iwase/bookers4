class BooksController < ApplicationController
before_action :authenticate_user!, :except=>[:about, :top]
before_action :correct_user, only: [:edit, :update]
    def about
    end
    def top
    end
    def new
    	@book =Book.new
    end
    def create
        @book =Book.new(book_params)
 		@book.user_id = current_user.id
    	if @book.save
    	redirect_to books_path(@book.id),notice: "post successfully"
        else
        @user = current_user
        @books = Book.all
        render :index
        end
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
        redirect_to book_path(@book.id),notice: "update successfully"
        else
        render :edit
        end
    end

    def index
        @user = current_user
        @book =Book.new
    	@books = Book.all

    end
    def show
        @book = Book.find(params[:id])
        @user = current_user
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
