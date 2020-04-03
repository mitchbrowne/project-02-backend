class Company < ApplicationRecord
  has_many :users
  has_many :ads, :through => :users
  has_many :galleries, :through => :users
end
