require 'rails_helper'

RSpec.describe BuyersController, type: :controller do
  let(:post) { create(:post) }
  let(:user) { create(:admin) }
  let(:buyer) { create(:buyer, post_id: post.id) }
  
  describe ".bought" do
    context "with bought products" do
      it "shows the products bought by a user" do
        allow(controller).to receive(:current_user).and_return(buyer)
        expect(response).to have_http_status(:success)
        controller.send(:bought)
      end
    end
  end

  describe ".index" do
    context "with all buyers for a product" do
      it "shows the list of buyers for a product" do
        allow(controller).to receive(:params).and_return(post_id: post.id)
        expect(response).to have_http_status(:success)
        controller.send(:index)
      end
    end
  end

  describe ".sell" do
    context "when a product is sold to a buyer" do
      it "sells a product to a particular buyer" do
        allow(controller).to receive(:params).and_return(id: buyer.id)
        expect(response).to have_http_status(:success)
        controller.send(:sell)
      end
    end
  end

  describe ".sold" do
    context "with sold products" do
      it "shows the products sold by a user" do
        allow(controller).to receive(:current_user).and_return(buyer)
        expect(response).to have_http_status(:success)
        controller.send(:sold)
      end
    end
  end
end
