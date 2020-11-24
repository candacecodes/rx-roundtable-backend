class User < ApplicationRecord
    has_many :selectedrxes
    has_many :rxes, through: :selectedrxes
    has_many :comments
    has_many :rxes, through: :comments

    has_secure_password

    validates :username, uniqueness: { case_sensitive: false }
    validates :username, length: { minimum: 3 }
end
