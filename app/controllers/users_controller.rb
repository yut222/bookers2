class UsersController < ApplicationController

before_action :is_matching_login_user, only: [:show, :edit]


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

end
