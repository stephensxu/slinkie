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
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      @links = Link.order('created_at DESC')
      current_user
      render :home
    else
      redirect_to root_url, notice: "Email and password has to be at least six characters long!"
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
