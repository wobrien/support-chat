class ChatsController < ApplicationController
  layout 'customer'
  
  skip_before_action :ensure_authenticated_user
  before_action :load_chat, only: [:show, :xxxxemail]
  
  def xxxxemail
   UserMailer.transcript(@chat, params[:email]).deliver
   # redirect_to chat_url(@chat)
   render text: "transcript sent to #{params[:email]}"
  end

  def show
  end
  
  private
  
  def load_chat
    @chat = Chat.find(params[:id])
  end
end

