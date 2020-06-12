require 'rails_helper'

RSpec.describe Message, type: :model do
  subject {
    described_class.new(body: "Something", post_id: 1, user_id: 1, receiver_id: 2)
  }
  context "validations" do
    describe ".body" do
      it "message having a content is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "message having no content is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
      it "message having content with length of minimum 1 character is valid" do
        subject = create(:post2)
        expect(subject).to be_valid
      end
      it "message not having content with length of minimum 1 character is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end

    describe "#post_id" do
      it "message associated with a post is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "message not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end

    describe "#user_id" do
      it "message having a sender is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "message not having a sender is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end

    describe "#receiver_id" do
      it "message having a receiver is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "message not having a receiver is invalid" do
        subject.receiver_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  

  context "associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :post }
  end 
end
