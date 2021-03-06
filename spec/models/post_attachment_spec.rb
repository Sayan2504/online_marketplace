require 'rails_helper'

RSpec.describe PostAttachment, type: :model do
  let(:user) { create(:user2) }
  let(:post) { create(:post1) }
  subject { described_class.new(post_id: post.id, user_id: user.id) }

  #validation tests
  describe "#post_id_presence" do
    context "when post id present" do
      it "post attachment associated with a post is valid" do
        expect(subject).to be_valid
      end
    end
    context "when post id not present" do
      it "post attachment not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#user_id_presence" do
    context "when user id present" do
      it "post attachment associated with an user is valid" do
        expect(subject).to be_valid
      end
    end
    context "when user id not present" do
      it "post attachment not associated with an user is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  

  #association tests
  describe "belongs_to :post" do
    it { is_expected.to belong_to :post }
  end  
end
