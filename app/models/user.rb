class User < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save { self.email = email.downcase }

    validates :name, presence: true, length: { maximum: 50 }
    validates :password, length: { minimum: 6 }
    validates :email, 
              presence: true, 
              length: { maximum: 225 }, 
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  has_secure_password 
end