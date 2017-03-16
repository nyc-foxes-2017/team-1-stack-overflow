class Vote < ActiveRecord::Base
  validates :num, presence:true
  belongs_to :votable, polymorphic: true
  belongs_to :user
end
