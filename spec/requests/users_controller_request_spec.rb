require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user2) }
  let(:post) { create(:post) }

  describe ".rejected" do
    context "with rejected posts" do
      it "shows the products rejected by admin" do
        allow(controller).to receive(:current_user).and_return(user)
        expect(response).to have_http_status(:success)
        controller.send(:rejected)
      end
    end
  end

  describe ".show" do
    context "with approved posts" do
      it "shows the products approved by admin" do
        allow(controller).to receive(:current_user).and_return(user)
        expect(response).to have_http_status(:success)
        controller.send(:show)
      end
    end
  end

  describe ".unchecked" do
    context "with unchecked posts" do
      it "shows the products unchecked by admin" do
        allow(controller).to receive(:current_user).and_return(user)
        expect(response).to have_http_status(:success)
        controller.send(:unchecked)
      end
    end
  end
end
