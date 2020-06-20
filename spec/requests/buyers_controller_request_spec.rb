require 'rails_helper'

RSpec.describe BuyersController, type: :controller do
  context "controller_methods" do
    describe ".bought" do
      let(:post) { create(:post1) }
      let(:buyer) { create(:buyer) }
      it "shows the products bought by a user" do
        allow(controller).to receive(:current_user).and_return(buyer)
        controller.send(:bought)
      end
    end

    describe ".index" do
      let(:post) { create(:post1) }
      let(:buyer) { create(:buyer) }
      it "shows the products bought by a user" do
        allow(controller).to receive(:params).and_return(post_id: post.id)
        controller.send(:index)
      end
    end

    #describe ".sell" do
    #  let(:post) { create(:post1) }
    #  let(:buyer) { create(:buyer) }
    #  let(:user) { create(:admin) }
    #  it "shows the products bought by a user" do
    #    allow(controller).to receive(:params).and_return(id: buyer.id)
    #    expect(controller).to receive(:redirect_to)
    #    controller.send(:sell)
    #  end
    #end

    describe ".sold" do
      let(:post) { create(:post1) }
      let(:buyer) { create(:buyer) }
      it "shows the products sold by a user" do
        allow(controller).to receive(:current_user).and_return(buyer)
        controller.send(:sold)
      end
    end
  end
end
