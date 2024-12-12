class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id]) # IDで指定されたBookを取得
    if @book.destroy
      redirect_to books_path, notice: 'Book was successfully deleted.' # 削除成功後にリダイレクト
    else
      redirect_to books_path, alert: 'Failed to delete the book.' # 削除に失敗した場合の処理
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
