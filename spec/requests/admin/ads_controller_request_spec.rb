require 'rails_helper'

RSpec.describe Admin::AdsController, type: :controller do
  let(:post) { create(:post) }
  let(:user) { create(:usernew) }

  describe ".approve" do
    context "when posts are approved" do
      it "approves the post and adds it to the approved post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).to receive(:redirect_to).with(admin_approved_path, {flash: {success: "This post has been approved by Admin"}})
        controller.send(:approve)
      end
    end 
      context "when posts are not approved" do
      it "does not approve the post and add it to the approved post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).not_to receive(:redirect_to).with(admin_approved_path, {flash: {success: "This post has not been approved by Admin"}})
        controller.send(:approve)
      end
    end
  end

  describe ".approved" do
    context "with approved posts" do
      it "returns the approved posts" do
        expect(response).to have_http_status(:success)
        controller.send(:approved)
      end
    end
  end

  describe ".reject" do
    context "when posts are rejected" do
      it "rejects the post and adds it to the rejected post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).to receive(:redirect_to).with(admin_rejected_path, {flash: {danger: "This post has been rejected by Admin"}})
        controller.send(:reject)
      end
    end
    context "when posts are not rejected" do
      it "does not reject the post and add it to the rejected post section" do
        allow(controller).to receive(:params).and_return(id: post.id)
        allow(controller).to receive(:current_user).and_return(user)
        expect(controller).not_to receive(:redirect_to).with(admin_rejected_path, {flash: {danger: "This post has not been rejected by Admin"}})
        controller.send(:reject)
      end
    end
  end

  describe ".rejected" do
    context "with rejected posts" do
      it "returns the rejected posts" do
        expect(response).to have_http_status(:success)
        controller.send(:rejected)
      end
    end
  end

  describe ".unchecked" do
    context "with unchecked posts" do
      it "returns the unchecked posts" do
        expect(response).to have_http_status(:success)
        controller.send(:unchecked)
      end
    end
  end
end
