class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

# 投稿一覧
  def index
    @books = Book.all  #bookテーブルの全情報を取得して、@books(複数形)に格納
    @book = Book.new
  end

  def show
  end

  def edit
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end

end
