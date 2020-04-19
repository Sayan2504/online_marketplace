class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    body = "[" + DateTime.parse(message.created_at.to_s).strftime("%a %I:%M %p") + "] " + "<strong>" + message.user.name + " : " + "</strong>" + message.body
    get_counter = Message.where(receiver_id: message.user_id, user_id: message.receiver_id).or (Message.where(user_id: message.user_id, receiver_id: message.receiver_id))
    counter = get_counter.count
    ActionCable.server.broadcast "chat_channel_#{message.receiver_id}", body: body, counter: counter
  end

  
end
