class Comment < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  validates :comment_content, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def time_since_posted
    self.distance_of_time_in_words(Time.now, self.created_at)
  end
end
