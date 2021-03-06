class User < ActiveRecord::Base
  has_many :articles
  has_secure_password
  before_save {self.email = email.downcase}
  validates :username, presence: true,
            length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX= /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/i;
  validates :email, presence: true,
            length: {minimum: 10, maximum: 50},
            uniqueness: {case_sensitive: true},
            format: {with: VALID_EMAIL_REGEX}


end