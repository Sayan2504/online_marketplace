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
  end
end
