require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe ".create" do
    context "when creating a new review" do
      it "creates new review" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
