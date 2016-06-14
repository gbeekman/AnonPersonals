class ChatsController < ApplicationController
  before_filter :require_signed_in

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @chat = @conversation.chats.build(chat_params)
    @chat.user_id = current_user.id
    @chat.save!

    @path = conversation_path(@conversation)
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end

end
