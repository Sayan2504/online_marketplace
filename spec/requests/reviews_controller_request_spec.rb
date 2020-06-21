require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  context "controller_methods" do
    describe ".create" do
      it "creates new review" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
