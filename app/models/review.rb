class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :description, :rating, :user_id, :product_id, presence: true
  validates :rating, :user_id, :product_id, numericality: true
  validates :rating, :inclusion => { :in => 1..5 }

end
