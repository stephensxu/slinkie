class UsersController < ApplicationController

  def index
    current_user
    @links = Link.order('created_at DESC')
    render :"users/home"
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
      redirect_to users_path
    else
      redirect_to root_path, notice: "Email and password has to be at least six characters long!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
