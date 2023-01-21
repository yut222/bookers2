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

  end

  private

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to users_path
    end
  end

end
