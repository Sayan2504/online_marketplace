require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  context "controller_methods" do
    describe ".create" do
      it "creates new message" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
