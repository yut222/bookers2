class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
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
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def update
    @books = Book.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."  #フラッシュメッセージ
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end