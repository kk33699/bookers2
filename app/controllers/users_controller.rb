class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
    def show
    @user = User.find(params[:id])  
    @books = @user.books.page(params[:page])
  end

  def edit
  end
end
