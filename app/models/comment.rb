class Comment < ActiveRecord::Base
  belongs_to :chat

  after_commit { CommentRelayJob.perform_later(self) }
end
