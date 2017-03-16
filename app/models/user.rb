class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :answered_questions, through: :answers, source: :question
  has_many :comments
  has_many :votes

  def people_reached
    (self.questions + self.answered_questions).map { |question| question.views }.inject(:+)
  end

  def reputation
    self.questions.map { |question| question.score }.pop + self.answers.map { |answer| answer.score }.pop
  end
end
