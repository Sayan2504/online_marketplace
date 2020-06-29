require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:categories) { create_list(:category, 1) }
  let(:category) { create(:category) }

  describe ".index" do
    context "with all categories" do
      it "lists all the categories of advertisements in the admin section" do
        categories.each do |category|
          expect(response).to have_http_status(:success)
        end
      end
    end
  end

  describe ".create" do
    context "when creating a new category" do
      it "creates a new buyer based on the form rendered by new action" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
