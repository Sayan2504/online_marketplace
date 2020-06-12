require 'rails_helper'

RSpec.describe Notification, type: :model do
  subject {
    Notification.new(body: "Something", post_id: 1, sender_id: 1, receiver_id: 2)
  }
  context "validations" do
    describe ".body" do
      it "notification having a content is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "notification having no content is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
      it "notification having content with length of minimum 1 character is valid" do
        subject = create(:post2)
        expect(subject).to be_valid
      end
      it "notification not having content with length of minimum 1 character is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end

    describe "#post_id" do
      it "notification associated with a post is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "notification not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end

    describe "#sender_id" do
      it "notification having a sender is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "notification not having a sender is invalid" do
        subject.sender_id = nil
        expect(subject).not_to be_valid
      end
    end

    describe "#receiver_id" do
      it "notification having a receiver is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "notification not having a receiver is invalid" do
        subject.receiver_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  
end
