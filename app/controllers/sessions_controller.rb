class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      login!(@user)
      render :"users/new"
    else
      redirect_to(root_url, notice: "Invalid email or password.")
    end
  end

  def destroy
    logout! if logged_in?
    redirect_to(root_url)
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
