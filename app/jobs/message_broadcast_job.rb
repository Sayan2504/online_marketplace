class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    body = "[" + DateTime.parse(message.created_at.to_s).strftime("%a %I:%M %p") + "] " + "<strong>" + message.user.name + " : " + "</strong>" + message.body
    ActionCable.server.broadcast "chat_channel_#{message.receiver_id}", body: body
  end

  private
  # def render_message(message)
  #   MessagesController.render(
  #     partial: 'message',
  #     locals: {
  #       message: message
  #     }
  #   )
  # end
end
