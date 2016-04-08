module Team
class ChatsController < ApplicationController
  before_action :load_chat, only: [:show, :take, :close]
  
  def index
    @my_chats    =  scoped_chats.where(assigned_to_id:  @current_user.id )                                      
    @other_chats = scoped_chats.where("assigned_to_id IS NULL OR assigned_to_id != #{@current_user.id}")  
  end
  
  def take
    @chat.update(assigned_to_id: @current_user.id)
    redirect_to team_chat_url(@chat)
  end
  
  def close
   @chat.update(closed: true)
   UserMailer.transcript(@chat, "william.obrien@test.com")
   redirect_to team_chat_url(@chat)
  end

  
  private
  
  def load_chat
    @chat = Chat.find(params[:id])
  end
  
  def scoped_chats
    @scope_chats ||=
    begin
      chats = Chat.all.order(:created_at)
      chats = chats.where(closed: params[:closed] == 'true') if (params[:closed])
      chats
    end
  end
end
end
