require 'rails_helper'

RSpec.describe NotificationsHelper, type: :helper do
  context "helper_methods" do
    describe "#notification_view" do
      let(:notification1) { Notification.new(body: "something", post_id: 1, receiver_id: 1, sender_id: 2, unread: "true") }
      it "finds the notification for a particular post" do
        expect(notification1).to be_valid
      end
    end
  end
end
