class Answer < ActiveRecord::Base
  validates :answer_content, :best_answer, presence: true
  validates :user, :question, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
