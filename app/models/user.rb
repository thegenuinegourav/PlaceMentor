class User < ActiveRecord::Base
    has_many :companies
    has_many :likes
    belongs_to :branch
    before_save {self.email = email.downcase }
    validates :username, presence: true, length: { minimum: 3, maximum: 70 }
    validates :phone, presence: true, length: {minimum: 10, maximum: 10 }
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: { maximum: 105 },
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
                                      
    has_secure_password
                                      
end