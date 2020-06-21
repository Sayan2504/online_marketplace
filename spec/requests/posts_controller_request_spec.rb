require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context "controller_methods" do
    describe ".approve" do
      let(:post) { create(:post1) }
      let(:user) { create(:usernew) }
      it "approves the post and adds it to the approved post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).to receive(:redirect_to).with(admin_approved_path, {flash: {success: "This post has been approved by Admin"}})
        controller.send(:approve)
      end
      it "does not approve the post and add it to the approved post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).not_to receive(:redirect_to).with(admin_approved_path, {flash: {success: "This post has not been approved by Admin"}})
        controller.send(:approve)
      end
    end

    describe ".approve_review" do
      let(:post) { create(:post) }
      let(:user) { create(:admin) }
      let(:review) { create(:review) }

      it "approves the review given on any post" do
        allow(controller).to receive(:params).and_return(id: review.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).to receive(:redirect_to)
        controller.send(:approve_review)
      end
      it "does not approve the review given on any post" do
        allow(controller).to receive(:params).and_return(id: review.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).not_to receive(:redirect_to).with(post_path(post), {flash: {success: "This review has not been approved by Admin"}})
        controller.send(:approve_review)
      end
    end

    describe ".index" do
      let(:post) { create(:post) }
      let(:category) { create(:category) }

      it "shows all the posts based on categories, location or name" do
        allow(controller).to receive(:params).and_return(ad_title: post.ad_title)
        allow(controller).to receive(:params).and_return(location: post.city)
        allow(controller).to receive(:params).and_return(category_id: post.category_id)
        allow(controller).to receive(:params).and_return(id: category.id)
        expect(response).to have_http_status(:success)
        controller.send(:index)
      end
    end

    describe ".reject" do
      let(:post) { create(:postnew) }
      let(:user) { create(:admin) }
      it "rejects the post and adds it to the rejected post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).to receive(:redirect_to).with(admin_rejected_path, {flash: {danger: "This post has been rejected by Admin"}})
        controller.send(:reject)
      end
      it "does not reject the post and add it to the rejected post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).not_to receive(:redirect_to).with(admin_rejected_path, {flash: {danger: "This post has not been rejected by Admin"}})
        controller.send(:reject)
      end
    end
  end
end
