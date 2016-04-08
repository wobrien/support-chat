class CommentsController < ApplicationController
  layout 'customer'
  
  skip_before_action :ensure_authenticated_user
  before_action :set_chat

  def create
    @comment = Comment.create! content: params[:comment][:content], chat: @chat
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end

