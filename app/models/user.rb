class User < ActiveRecord::Base
  
  has_many :reviews
  
  has_secure_password
  
  validates_uniqueness_of :email

  validates_presence_of :first_name, :last_name, :email

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:minimum => 4}



end
