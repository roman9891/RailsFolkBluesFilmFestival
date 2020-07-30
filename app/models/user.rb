class User < ApplicationRecord
    has_many :movies, dependent: :destroy
    has_many :comments
    has_secure_password
    has_one_attached :avatar

    #we have to make sure we change password to password_digest when we add bcrypt
    validates :email,:name,:password, presence: true
    validates :email, uniqueness: true

end
