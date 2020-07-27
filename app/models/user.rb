class User < ApplicationRecord
    has_many :movies
    has_many :comments
end
