class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :first_name, :last_name, :email, :password
  
  validates_uniqueness_of :email
end
