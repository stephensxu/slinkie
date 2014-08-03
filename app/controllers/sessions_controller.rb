class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      login!(@user)
      current_user
      p "created a session, now session[:user_id] look like #{session[:user_id]}"
      p "logged in ? #{logged_in?}"
      render :"users/home"
    else
      redirect_to(root_url, notice: "Invalid email or password.")
    end
  end

  def show
    current_user
    render :"users/home"
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
