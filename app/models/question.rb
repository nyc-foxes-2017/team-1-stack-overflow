class Question < ActiveRecord::Base
  include Votables
  include ActionView::Helpers::DateHelper
  validates :question_content, :title, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def has_best_answer?
    self.answers.map { |answer| answer.best_answer }.include?(true)
  end
  
  def time_since_posted
    self.distance_of_time_in_words(Time.now, self.created_at)
  end

end
