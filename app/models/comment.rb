class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :context, presence: true, length: { minimum: 5, maximimum: 1000 }
  
  after_create_commit :send_it
  
  def send_it
    puts "ello"
    CommentBroadcastJob.perform_later(self) 
  end
end