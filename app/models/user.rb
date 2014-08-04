class User < ActiveRecord::Base
  has_secure_password

  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 6 }
  validates :password, :presence => true, :length => { :minimum => 6 }

  has_many :links
end
