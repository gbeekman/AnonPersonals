class MessagesController < ApplicationController
  before_filter :require_signed_in

  def new
    render :new

  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.personals_id = params[:personal_id]
    @message.receiver_id = Personal.find(@message.personals_id).user_id

    if @message.save
      redirect_to user_url(@current_user)
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end

  def index
    @messages = Message.where("receiver_id = ?", current_user.id)

  end

  def show
    @message = Message.find(params[:id])

    if params[:accept]
      user = User.find(@message.sender_id)
      user.partners << @current_user
      @current_user.partners << user
      @current_user.save
      user.save
      auto_confirm(@message)
      redirect_to messages_url, notice: "You can now chat with #{user.username}."
    elsif params[:reject]
      @message.destroy
      redirect_to messages_url, notice: "Message deleted"
    end


  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to messages_url

  end

  private

  def message_params
    params.require(:message).permit(:body, :title)
  end

  def auto_confirm(message)
    user_name = User.find(message.receiver_id)


    confirm_message = Message.new()
    confirm_message.receiver_id = message.sender_id
    confirm_message.sender_id = message.receiver_id
    confirm_message.personals_id = message.personals_id
    confirm_message.title = "Your message has been accepted!"
    confirm_message.body = "Your reply to #{message.title} was accepted. You may now chat with #{user_name.username}."

    confirm_message.save
  end
end
