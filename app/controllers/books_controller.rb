class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

# 投稿一覧
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.all #find(params[:id])
    @user = current_user
    flash[:notice] = "You have created book successfully."  # 新規作成成功フラッシュメッセージ
    flash[:notice] = "Welcome! You have signed up successfully."  # sign_up用フラッシュメッセージ
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path  # リダイレクト
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:user.name, :title, :body, :image)
  end

end
