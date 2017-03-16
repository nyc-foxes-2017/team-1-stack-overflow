class Vote < ActiveRecord::Base
  validates :up_down, presence:true
  belongs_to :votable, polymorphic: true
  belongs_to :user
end
