require 'rails_helper'

RSpec.describe PostAttachment, type: :model do
  let(:user) { create(:user4) }
  let(:post) { create(:post1) }
  subject { described_class.new(post_id: post.id, user_id: user.id) }

  context "validations" do
    describe "#post_id" do
      it "post attachment associated with a post is valid" do
        expect(subject).to be_valid
      end
      it "post attachment not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
    describe "#user_id" do
      it "post attachment having a sender is valid" do
        expect(subject).to be_valid
      end
      it "message not having a sender is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  

  context "associations" do
    it { is_expected.to belong_to :post }
  end  
end
