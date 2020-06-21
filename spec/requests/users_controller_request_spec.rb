require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "controller_methods" do
    describe ".rejected" do
      let(:user) { create(:user4) }
      let(:post) { create(:post1) }
      it "shows the products rejected by admin" do
        allow(controller).to receive(:current_user).and_return(user)
        expect(response).to have_http_status(:success)
        controller.send(:rejected)
      end
    end

    describe ".show" do
      let(:user) { create(:user4) }
      let(:post) { create(:post1) }
      it "shows the products approved by admin" do
        allow(controller).to receive(:current_user).and_return(user)
        expect(response).to have_http_status(:success)
        controller.send(:show)
      end
    end

    describe ".unchecked" do
      let(:user) { create(:user4) }
      let(:post) { create(:post1) }
      it "shows the products unchecked by admin" do
        allow(controller).to receive(:current_user).and_return(user)
        expect(response).to have_http_status(:success)
        controller.send(:unchecked)
      end
    end
  end
end
