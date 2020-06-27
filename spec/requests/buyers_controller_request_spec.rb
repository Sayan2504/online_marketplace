require 'rails_helper'

RSpec.describe BuyersController, type: :controller do
  let(:post) { create(:post) }
  let(:user) { create(:admin) }
  let(:buyer) { create(:buyer, post_id: post.id) }
  
  context "controller_methods" do
    describe ".bought" do
      it "shows the products bought by a user" do
        allow(controller).to receive(:current_user).and_return(buyer)
        expect(response).to have_http_status(:success)
        controller.send(:bought)
      end
    end

    describe ".index" do
      it "shows the products bought by a user" do
        allow(controller).to receive(:params).and_return(post_id: post.id)
        expect(response).to have_http_status(:success)
        controller.send(:index)
      end
    end

    describe ".sell" do
      it "shows the products bought by a user" do
        allow(controller).to receive(:params).and_return(id: buyer.id)
        expect(response).to have_http_status(:success)
        controller.send(:sell)
      end
    end

    describe ".sold" do
      it "shows the products sold by a user" do
        allow(controller).to receive(:current_user).and_return(buyer)
        expect(response).to have_http_status(:success)
        controller.send(:sold)
      end
    end
  end
end
