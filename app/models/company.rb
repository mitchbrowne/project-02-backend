class Company < ApplicationRecord
  has_many :users
  has_many :ads
  has_many :galleries, :through => :users
end
