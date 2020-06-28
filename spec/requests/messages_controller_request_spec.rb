require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe ".create" do
    context "when creating a new message" do
      it "creates new message" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
