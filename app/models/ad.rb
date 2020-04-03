class Ad < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :company, :optional => true
  has_and_belongs_to_many :galleries
end
