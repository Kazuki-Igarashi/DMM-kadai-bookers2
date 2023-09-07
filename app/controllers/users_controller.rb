class UsersController < ApplicationController
     before_action :is_matching_login_user, only: [:edit, :update]


  def edit
    @user = current_user
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  
  def update
    @user = current.user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end

