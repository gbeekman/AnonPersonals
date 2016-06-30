module ChatsHelper
  def self_or_other(chat)
    chat.user == current_user ? "self" : "other"
  end

  def chat_interlocutor(chat)
    chat.user == chat.conversation.sender ? chat.conversation.sender : chat.conversation.recipient
  end
end
