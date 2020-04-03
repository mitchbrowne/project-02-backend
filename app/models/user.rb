class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  
  belongs_to :company, :optional => true
  has_many :ads
  has_many :galleries
end
