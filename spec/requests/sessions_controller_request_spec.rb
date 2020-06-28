require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe ".fb_google_create" do
    context "when creating a new session via fb or google" do
      it "creates new session via facebook or google authentication" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
