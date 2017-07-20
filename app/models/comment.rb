class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validates :context, presence: true, length: { minimum: 3, maximum: 1000 }
  
  after_create_commit { CommentBroadcastJob.perfom_later(self)}
end
