class Answer < ActiveRecord::Base
  include Votables
  include ActionView::Helpers::DateHelper
  validates :answer_content, presence: true
  validates :user, :question, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def time_since_posted
    self.distance_of_time_in_words(Time.now, self.created_at)
  end
end
