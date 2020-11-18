class Rx < ApplicationRecord
    has_many :selectedrxes
    has_many :users, through: :selectedrxes
    has_many :comments
    has_many :rxes, through: :comments
end
