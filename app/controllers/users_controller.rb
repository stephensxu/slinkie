class UsersController < ApplicationController

  def index
    @users = User.order('created_at DESC')
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    if user_params[:password].length < 6 || user_params[:email].length < 6
      redirect_to root_url, notice: "Email and password has to be at least six characters long!"
    else
      @user = User.new(user_params)
      @user.save
      login!(@user)
      current_user
      render :home
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
