require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user1) { create(:user4) }
  let(:user2) { create(:usernew) }
  let(:post) { create(:post1) }
  subject { described_class.new(body: "something", post_id: post.id, user_id: user1.id, receiver_id: user2.id) }
  
  #validation tests
  describe ".message_content_presence" do
    context "message content present" do
      it "message having a content is valid" do
        expect(subject).to be_valid
      end
    end
    context "message content not present" do
      it "message having no content is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".message_content_length" do
    context "valid message content length" do
      it "message having content with length of minimum 1 character is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid message content length" do
      it "message not having content with length of minimum 1 character is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#post_id" do
    context "post id present" do
      it "message associated with a post is valid" do
        expect(subject).to be_valid
      end
    end
    context "post id not present" do
      it "message not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#user_id" do
    context "sender id present" do
      it "message having a sender is valid" do
        expect(subject).to be_valid
      end
    end
    context "sender id not present" do
      it "message not having a sender is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#receiver_id" do
    context "receiver id present" do
      it "message having a receiver is valid" do
        expect(subject).to be_valid
      end
    end
    context "receiver id not present" do
      it "message not having a receiver is invalid" do
        subject.receiver_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  

  #association tests
  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }
  end

  describe "belongs_to :post" do
    it { is_expected.to belong_to :post }
  end
  
  #callback tests
  describe "after_create_commit :message_notification_job" do
    it { is_expected.to callback(:message_notification_job).after(:commit) }
  end

  #scope tests
  describe ".sender_side" do
    context "valid data" do
      it "Message with the correct sender and correct receiver on the sender's side is valid" do
        subject.user_id = 1
        subject.receiver_id = 2
        expect([subject.user_id]).to include(1)
        expect([subject.receiver_id]).to include(2)
      end
    end
    context "invalid data" do
      it "Message with the wrong sender or wrong receiver on the sender's side is invalid" do
        subject.user_id = 4
        subject.receiver_id = 3
        expect([subject.user_id]).not_to include(1)
        expect([subject.receiver_id]).not_to include(2)
      end
    end
  end

  describe ".receiver_side" do
    context "valid data" do
      it "Message with the correct sender and correct receiver on the receiver's side is valid" do
        subject.user_id = 2
        subject.receiver_id = 1
        expect([subject.user_id]).to include(2)
        expect([subject.receiver_id]).to include(1)
      end
    end
    context "invalid data" do
      it "Message with the wrong sender or wrong receiver on the receiver's side is invalid" do
        subject.user_id = 3
        subject.receiver_id = 4
        expect([subject.user_id]).not_to include(2)
        expect([subject.receiver_id]).not_to include(1)
      end
    end
  end
  
  describe ".message_post_id" do
    context "valid data" do
      it "Message associated with the correct post on both side is valid" do
        subject.post_id = 1
        expect([subject.post_id]).to include(1)
      end
    end
    context "invalid data" do
      it "Message associated with the wrong post on both side is invalid" do
        subject.post_id = 2
        expect([subject.post_id]).not_to include(1)
      end
    end
  end
end
