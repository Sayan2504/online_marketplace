require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user1) { create(:admin) }
  let(:user2) { create(:user2) }
  let(:post) { create(:post1) }
  subject { described_class.new(body: "Something", post_id: post.id, sender_id: user1.id, receiver_id: user2.id) }

  #validation tests
  describe ".notification_content_presence" do
    context "when notification content present" do
      it "notification having a content is valid" do
        expect(subject).to be_valid
      end
    end
    context "when notification content not present" do
      it "notification having no content is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".notification_content_length" do
    context "with valid notification content length" do
      it "notification having content with length of minimum 1 character is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid notification content length" do
      it "notification not having content with length of minimum 1 character is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#post_id_presence" do
    context "when post id present" do
      it "notification associated with a post is valid" do
        expect(subject).to be_valid
      end
    end
    context "when post id not present" do
      it "notification not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#sender_id_presence" do
    context "when sender id present" do
      it "notification having a sender is valid" do
        expect(subject).to be_valid
      end
    end
    context "when sender id not present" do
      it "notification not having a sender is invalid" do
        subject.sender_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#receiver_id_presence" do
    context "when receiver id present" do
      it "notification having a receiver is valid" do
        expect(subject).to be_valid
      end
    end
    context "when receiver id not present" do
      it "notification not having a receiver is invalid" do
        subject.receiver_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  
end
