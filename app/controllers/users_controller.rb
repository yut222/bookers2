class UsersController < ApplicationController

#before_action :is_matching_login_user, only: [:edit]

  def new
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"  #フラッシュメッセージ
      redirect_to books_path
    else
      render :show
    end
  end

  def edit
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def update
    @books = Book.all
    @user = User.find(params[:id]) #不要？
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."  #フラッシュメッセージ
      redirect_to user_path(@user.id)
    else
      render :show
    end
  end

  private



  # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
