class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.includes(:user)
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @book = Book.find(params[:id])
    
    redirect_to user_path(current_user), notice: 'You are not authorized to edit this book.' unless @book.user == current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.（新規投稿しました）'
    else
      @books = Book.includes(:user) 
      @user = current_user
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id]) 
    if @book.destroy
      redirect_to books_path, notice: 'Book was successfully deleted.'
    else
      redirect_to books_path, alert: 'Failed to delete the book.' 
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) 
      redirect_to book_path(@book), notice: 'Book was successfully updated.（投稿を更新しました）'
    else
      render :edit
    end
  end

  private
  def is_matching_login_user
    book = Book.find(params[:id])
    user = book.user
    unless user.id == current_user.id
      redirect_to books_path, alert: 'You are not authorized to edit this user.'
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
