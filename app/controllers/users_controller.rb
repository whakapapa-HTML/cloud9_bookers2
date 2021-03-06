class UsersController < ApplicationController
before_action :ensure_correct_user, {only:[:edit, :update]}

    def new
      @book = Book.new
    end

    def index
      @book = Book.new
      @users = User.all
      @user = current_user
    end

    def show
      @book = Book.new
      @user = User.find(params[:id])
      @user_books = @user.books
    end

    def edit
      @user = User.find(current_user.id)
    end

    def update
          # @user = User.new(user_params)
          @user = User.find(params[:id])
      if  @user.update(user_params)
          flash[:notice] = "Your profile has been successfully edited"
          redirect_to user_path(@user.id)
      else
        render :edit
      end
    end

    private

    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end


    def ensure_correct_user
      if current_user.id != params[:id].to_i
         redirect_to user_path(current_user)
      end
    end

end
