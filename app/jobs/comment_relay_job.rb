class CommentRelayJob < ApplicationJob
  def perform(comment)
    ActionCable.server.broadcast "chats:#{comment.chat_id}:comments",
                                 comment: Team::CommentsController.render(partial: 'team/comments/comment', locals: { comment: comment })
  end
end
