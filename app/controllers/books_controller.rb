class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.includes(:user)
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.where(user_id: @user.id)
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

  def update
    @book = Book.find(params[:id]) # 編集対象のBookを取得
    if @book.update(book_params) # フォームから送信されたデータで更新
      redirect_to book_path(@book), notice: 'Book was successfully updated.' # 更新成功時にリダイレクト
    else
      render :edit # 更新失敗時に編集画面を再表示
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
