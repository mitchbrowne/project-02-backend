class History < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :ad, :optional => true
end