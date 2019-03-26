class User < ActiveRecord::Base
  
  has_many :reviews
  
  has_secure_password
  
  validates_uniqueness_of :email

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  #validates :last_name, presence true
  #validates :email, presence true
  #validates :paswword, presence true
  #validates :password_confirmation, presence true

end
