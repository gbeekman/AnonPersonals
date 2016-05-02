class MessagesController < ApplicationController

  def new
    render :new

  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.personals_id = @message(params[:personal_id])
    @message.receiver_id = Personal.find(@message.personals_id).user_id

    if @message.save
      redirect_to user_url
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end

  def index
    @messages = Message.where("receiver_id = ?" @current_user.id)

  end

  def show
    @message = Message.find(params[:id])

  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to messages_url

  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
