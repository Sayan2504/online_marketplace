require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context "controller_methods" do
    describe ".index" do
      it "displays the homepage of the application" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
