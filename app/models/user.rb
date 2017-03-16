class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def people_reached
    self.questions.map { |question| question.views }.inject(:+) + self.answers.map { |answer| answer.question.views }.inject(:+)
  end
end
