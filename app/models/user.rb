class User < ActiveRecord::Base
  has_secure_password
  

  # attr_accessor :first_name, :last_name, :email, :password_digest
  
  validates_uniqueness_of :email
end
