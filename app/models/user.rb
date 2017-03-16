class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end
