class BooksController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
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
    @book_show = Book.find(params[:id])
    @books = Book.all
    @user = current_user
#    redirect_to book_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id]) #不要？
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."  #フラッシュメッセージ
      redirect_to book_path(@book.id)
    else
      render :show
    end
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

  # アクセス制限
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
  end

end