class User < ApplicationRecord
  has_many :articles
  has_many :comments

  has_secure_password

  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
