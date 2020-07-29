class User < ApplicationRecord
    has_many :movies
    has_many :comments

    validates :email, presence: true
    validates :email, uniqueness: true

end
