class UsersController < ApplicationController

    def create

    end

    def show
        @user = User.find(params[:id])
        @user_books = @user.books
    end

    def index
        @users = User.all
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end



    def update
        # @user = User.new(user_params)
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    private

    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end

end
