require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  context "controller_methods" do
    describe ".index" do
      it "shows all notification" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
