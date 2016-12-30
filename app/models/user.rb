class User < ActiveRecord::Base
  validates :username, presence: true,
            length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX= /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/i;
  validates :email, presence: true,
            length: {minimum: 10, maximum: 50},
            uniqueness: {case_sensitive: true},
            format: {with: VALID_EMAIL_REGEX}
  has_many :articles
end