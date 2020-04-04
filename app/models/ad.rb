class Ad < ApplicationRecord
  has_many :histories
  belongs_to :user, :optional => true
  has_many :users, :through => :histories
  belongs_to :company, :optional => true
  has_and_belongs_to_many :galleries
end
