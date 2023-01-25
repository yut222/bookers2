class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save  #バリデーション
      flash[:notice] = "You have created book successfully."  #フラッシュメッセージ
      redirect_to book_path(@book.id)
    else
      render :index  #ブックの一覧画面を表示
    end
  end

# 投稿一覧
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = current_user
    redirect_to book_path
  end

  def edit
  end

  def update
    flash[:notice] = "successfully"  #フラッシュメッセージ
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path  # リダイレクト
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end