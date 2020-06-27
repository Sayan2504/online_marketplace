require 'rails_helper'

RSpec.describe Admin::AdsController, type: :controller do
  let(:post) { create(:post) }
  let(:user) { create(:usernew) }
  context "controller_methods" do
    describe ".approve" do
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

    describe ".approved" do
      it "returns the approved posts" do
        expect(response).to have_http_status(:success)
        controller.send(:approved)
      end
    end

    describe ".reject" do
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

    describe ".rejected" do
      it "returns the rejected posts" do
        expect(response).to have_http_status(:success)
        controller.send(:rejected)
      end
    end

    describe ".unchecked" do
      it "returns the unchecked posts" do
        expect(response).to have_http_status(:success)
        controller.send(:unchecked)
      end
    end
  end
end
