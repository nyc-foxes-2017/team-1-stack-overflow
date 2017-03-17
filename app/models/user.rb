class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: {minimum: 6}

  has_many :questions
  has_many :answers
  has_many :answered_questions, through: :answers, source: :question
  has_many :comments
  has_many :votes

  def people_reached
    return 0 if self.questions.count == 0 && self.answers.count == 0
    (self.questions + self.answered_questions).map { |question| question.views }.inject(:+)
  end

  def reputation
    if self.questions.count > 0 && self.answers.count > 0
      self.questions.map { |question| question.score }.pop + self.answers.map { |answer| answer.score }.pop
    elsif self.questions.count > 0 && self.answers.count == 0
      self.questions.map { |question| question.score }.pop
    elsif self.questions.count == 0 && self.answers.count > 0
      self.answers.map { |answer| answer.score }.pop
    else
      0
    end
  end
end
