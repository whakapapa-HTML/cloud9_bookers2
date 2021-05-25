class BooksController < ApplicationController

  def index
   if @user == current_user
    @user = User.find(params[:id])
    @user_books = @user.books
    @book = Book.new
   end
  end

  def create
    @book = Book.new(book_params)
  if @book.save
    redirect_to book_path(@book.id)
  else
    render "index"
  end
  end

  def show
    @user = User.find(params[:id])
    @user_books = @user.books
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
