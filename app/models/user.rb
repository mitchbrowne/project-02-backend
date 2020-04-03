class User < ApplicationRecord
  belongs_to :company, :optional => true
  has_many :ads
  has_many :galleries
end
