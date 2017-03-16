class Question < ActiveRecord::Base
  validates :question_content, :title, presence: true
  validates :user, presence: true

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def has_best_answer?
    self.answers.map { |answer| answer.best_answer }.include?(true)
  end
end
