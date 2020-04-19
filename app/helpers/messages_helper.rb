module MessagesHelper
    @notifications = Message.all.reverse
end
