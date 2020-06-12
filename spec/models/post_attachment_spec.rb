require 'rails_helper'

RSpec.describe PostAttachment, type: :model do
  context "validations" do
    describe "#post_id" do
      let(:post_attachment) { PostAttachment.new(post_id: 1, user_id: 1) }
      let(:post_attachment_missing_post) { PostAttachment.new(user_id: 1) }
      
      it "post attachment associated with a post is valid" do
        post_attachment = create(:post1)
        expect(post_attachment).to be_valid
      end
      it "post attachment not associated with a post is invalid" do
        expect(post_attachment_missing_post).not_to be_valid
      end
    end

    describe "#user_id" do
      let(:post_attachment) { PostAttachment.new(post_id: 1, user_id: 1) }
      let(:post_attachment_missing_user) { PostAttachment.new(post_id: 1) }
      
      it "post attachment having a sender is valid" do
        post_attachment = create(:post1)
        expect(post_attachment).to be_valid
      end
      it "message not having a sender is invalid" do
        expect(post_attachment_missing_user).not_to be_valid
      end
    end
  end  

  context "associations" do
    it "one post attachment belongs to a particular post" do
      expect(PostAttachment.reflect_on_association(:post).macro).to eq :belongs_to
    end
  end  
end
