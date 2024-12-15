class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @books = @user.books.page(params[:page])
    @book = Book.new 
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'You have updated user successfully.(プロフィール編集をしました)'
    else
      render :edit
    end
  end

  private


  def set_user
    @user = User.find(params[:id]) 
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image) 
  end
end