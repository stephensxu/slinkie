class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  # protect_from_forgery

  def current_user
    return nil if session[:user_id] == nil

    @current_user ||= User.find_by_id(session[:user_id])
  end

  def login!(user)
    session[:user_id] = user.id
    @links = Link.order('created_at DESC')
    @current_user = user
  end

  def logout!
    @current_user = nil
    session.clear
  end

  def logged_in?
    current_user.present?
  end

  def redirect_if_logged_in!(url = root_url)
    if logged_in?
      redirect_to(url)
    end
  end
end
