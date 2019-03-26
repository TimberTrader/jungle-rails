class User < ActiveRecord::Base
  
  has_many :reviews
  
  has_secure_password
  
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}

  validates_presence_of :first_name, :last_name, :email

  validates :password, :presence => true, :confirmation => true, :length => {:minimum => 4}
  
  def self.authenticate_with_credentials(email, password)
    user = User.where("lower(email) = ?", email.strip.downcase).first unless email == nil
    if user && user.authenticate(password)
      user
    else
      nil
  end
end
