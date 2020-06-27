require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user1) { create(:user4) }
  let(:user2) { create(:usernew) }
  let(:post) { create(:post1) }
  subject { described_class.new(body: "Something", post_id: post.id, sender_id: user1.id, receiver_id: user2.id) }

  context "validations" do
    describe ".body" do
      it "notification having a content is valid" do
        expect(subject).to be_valid
      end
      it "notification having no content is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
      it "notification having content with length of minimum 1 character is valid" do
        expect(subject).to be_valid
      end
      it "notification not having content with length of minimum 1 character is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end
    describe "#post_id" do
      it "notification associated with a post is valid" do
        expect(subject).to be_valid
      end
      it "notification not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
    describe "#sender_id" do
      it "notification having a sender is valid" do
        expect(subject).to be_valid
      end
      it "notification not having a sender is invalid" do
        subject.sender_id = nil
        expect(subject).not_to be_valid
      end
    end
    describe "#receiver_id" do
      it "notification having a receiver is valid" do
        expect(subject).to be_valid
      end
      it "notification not having a receiver is invalid" do
        subject.receiver_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  
end
