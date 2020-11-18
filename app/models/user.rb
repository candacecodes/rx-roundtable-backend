class User < ApplicationRecord
    has_many :selectedrxes
    has_many :rxes, through: :selectedrxes
    has_many :comments
    has_many :rxes, through: :comments
end
