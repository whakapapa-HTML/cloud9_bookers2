class BooksController < ApplicationController

  def new
      @book = Book.new
  end

  def index
      @book = Book.new
      @books = Book.all
      @users = User.all
      @user = current_user
  end

  def create
       @book = Book.new(book_params)
       @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "Book has been successfully created"
       redirect_to book_path(@book.id)
    else
       @books = Book.all
       @user = User.find(current_user.id)
       render :index
    end
  end

  def show
    @book = Book.new
    @user_book = Book.find(params[:id])
    @user = @user_book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(book_params)
       flash[:notice] = "Book has been successfully edited"
       redirect_to book_path(@book.id)
   else
     render :edit
   end
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