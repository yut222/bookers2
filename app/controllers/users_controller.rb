class UsersController < ApplicationController

before_action :is_matching_login_user, only: [:edit]


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_parms)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to users_path
    end
  end

end
