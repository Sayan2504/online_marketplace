require 'rails_helper'

RSpec.describe Message, type: :model do
  context "validations" do
    describe ".body" do
      let(:message) { Message.new(body: "Something", post_id: 1, user_id: 1, receiver_id: 2) }
      let(:message_invalid_body) { Message.new(body: "", post_id: 1, user_id: 1, receiver_id: 2) }
      let(:message_invalid_body_length) { Message.new(body: "", post_id: 1, user_id: 1, receiver_id: 2) }
      
      it "message having a content is valid" do
        message = create(:post1)
        expect(message).to be_valid
      end
      it "message having no content is invalid" do
        expect(message_invalid_body).not_to be_valid
      end
      it "message having content with length of minimum 1 character is valid" do
        message = create(:post2)
        expect(message).to be_valid
      end
      it "message not having content with length of minimum 1 character is invalid" do
        expect(message_invalid_body_length).not_to be_valid
      end
    end

    describe "#post_id" do
      let(:message) { Message.new(body: "Something", post_id: 1, user_id: 1, receiver_id: 2) }
      let(:message_missing_post) { Message.new(body: "Something", user_id: 1, receiver_id: 2) }
      
      it "message associated with a post is valid" do
        message = create(:post1)
        expect(message).to be_valid
      end
      it "message not associated with a post is invalid" do
        expect(message_missing_post).not_to be_valid
      end
    end

    describe "#user_id" do
      let(:message) { Message.new(body: "Something", post_id: 1, user_id: 1, receiver_id: 2) }
      let(:message_missing_sender) { Message.new(body: "Something", post_id: 1, receiver_id: 2) }
      
      it "message having a sender is valid" do
        message = create(:post1)
        expect(message).to be_valid
      end
      it "message not having a sender is invalid" do
        expect(message_missing_sender).not_to be_valid
      end
    end

    describe "#receiver_id" do
      let(:message) { Message.new(body: "Something", post_id: 1, user_id: 1, receiver_id: 2) }
      let(:message_missing_receiver) { Message.new(body: "Something", post_id: 1, user_id: 1) }
      
      it "message having a receiver is valid" do
        message = create(:post1)
        expect(message).to be_valid
      end
      it "message not having a receiver is invalid" do
        expect(message_missing_receiver).not_to be_valid
      end
    end
  end  
end
