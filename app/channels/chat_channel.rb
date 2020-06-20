class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_channel_#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
