class Answer < ActiveRecord::Base
  include Votables
  validates :answer_content, presence: true
  validates :user, :question, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
