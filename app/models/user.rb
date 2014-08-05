require 'valid_email'
class User < ActiveRecord::Base
  has_secure_password

  validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 6 }, email: true
  validates :password, :presence => true, :length => { :minimum => 6 }

  has_many :links
end
