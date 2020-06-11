require 'rails_helper'

RSpec.describe Message, type: :model do
  context "validations" do
    describe ".body" do
      let(:notification) { Notification.new(body: "Something", post_id: 1, sender_id: 1, receiver_id: 2) }
      let(:notification_invalid_body) { Notification.new(body: "", post_id: 1, sender_id: 1, receiver_id: 2) }
      let(:notification_invalid_body_length) { Notification.new(body: "", post_id: 1, sender_id: 1, receiver_id: 2) }
      
      it "notification having a content is valid" do
        notification = create(:post1)
        expect(notification).to be_valid
      end
      it "notification having no content is invalid" do
        expect(notification_invalid_body).not_to be_valid
      end
      it "notification having content with length of minimum 1 character is valid" do
        notification = create(:post2)
        expect(notification).to be_valid
      end
      it "notification not having content with length of minimum 1 character is invalid" do
        expect(notification_invalid_body_length).not_to be_valid
      end
    end

    describe "#post_id" do
      let(:notification) { Notification.new(body: "Something", post_id: 1, sender_id: 1, receiver_id: 2) }
      let(:notification_missing_post) { Notification.new(body: "Something", sender_id: 1, receiver_id: 2) }
      
      it "notification associated with a post is valid" do
        notification = create(:post1)
        expect(notification).to be_valid
      end
      it "notification not associated with a post is invalid" do
        expect(notification_missing_post).not_to be_valid
      end
    end

    describe "#sender_id" do
      let(:notification) { Notification.new(body: "Something", post_id: 1, sender_id: 1, receiver_id: 2) }
      let(:notification_missing_sender) { Notification.new(body: "Something", post_id: 1, receiver_id: 2) }
      
      it "notification having a sender is valid" do
        notification = create(:post1)
        expect(notification).to be_valid
      end
      it "notification not having a sender is invalid" do
        expect(notification_missing_sender).not_to be_valid
      end
    end

    describe "#receiver_id" do
      let(:notification) { Notification.new(body: "Something", post_id: 1, sender_id: 1, receiver_id: 2) }
      let(:notification_missing_receiver) { Notification.new(body: "Something", post_id: 1, sender_id: 1) }
      
      it "notification having a receiver is valid" do
        notification = create(:post1)
        expect(notification).to be_valid
      end
      it "notification not having a receiver is invalid" do
        expect(notification_missing_receiver).not_to be_valid
      end
    end
  end  
end
