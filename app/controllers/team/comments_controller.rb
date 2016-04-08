module Team
  class CommentsController < ApplicationController
    before_action :set_chat

    def create
      @comment = Comment.create! content: params[:comment][:content], chat: @chat, user_id: @current_user.id
    end

    private

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end
  end
end
