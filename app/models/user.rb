class User < ActiveRecord::Base
  has_secure_password

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => { :minimum => 6 }

  def authenticate?(unencrypted_password)
    unencrypted_password == self.password
  end

  def log_in(user_id)
    session[:user_id] = user_id
  end

  def log_out
    session.clear
  end

  def logged_in?
    if session[:user_id] != nil
      p "session hash looks like #{session.inspect}"
      p "session[:user_id] looks like #{session[:user_id]}"
      true
    else
      false
    end
  end
end
