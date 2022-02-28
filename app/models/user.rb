class User < ApplicationRecord
  #has_many :events, dependent: :delete_all
  has_many :events_users
  has_many :events, through: :events_users
  has_one :address
  has_many :comments, as: :commentable

  validates :username, presence: true, length: {minimum:3 , maximum:25}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,uniqueness: {case_sensitive: false}, length: {maximum:105}, format: { with: VALID_EMAIL_REGEX}
  has_secure_password
end
