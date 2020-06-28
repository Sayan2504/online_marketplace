require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  describe ".index" do
    context "with all message notifications" do
      it "shows all message notification" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
