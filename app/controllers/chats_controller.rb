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
  
  def create
    @chat = Chat.create! chat_params
    redirect_to chat_url(@chat)
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:title, :content)
  end
  
  def load_chat
    @chat = Chat.find(params[:id])
  end
end

