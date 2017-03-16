class Comment < ActiveRecord::Base
  validates :comment_content, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
