require 'rails_helper'

RSpec.describe NotificationsChannel, type: :channel do
  let (:user1) { create(:user) }

  before { stub_connection current_user: user1 }
  
  describe "#subscribed" do
    it "successfully subscribes" do
      subscribe()
      expect(subscription).to have_stream_from("notification_channel_#{user1.id}")
    end
  end
  
  describe "#unsubscribed" do
    it "is expected to successfully unsubscribed" do
      subscribe()
      unsubscribe
      expect(subscription).to_not have_streams
    end
  end
end
