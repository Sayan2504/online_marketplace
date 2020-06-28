require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe ".index" do
    context "with the homepage" do
      it "displays the homepage of the application" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
