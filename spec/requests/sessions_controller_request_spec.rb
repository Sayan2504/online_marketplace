require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "controller_methods" do
    describe ".fb_google_create" do
      it "displays the homepage of the application" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
