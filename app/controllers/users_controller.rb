class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])  
    @books = @user.books.page(params[:page])
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image) 
  end
end
