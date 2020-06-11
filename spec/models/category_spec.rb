require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    
    describe ".name" do
      let(:category) { Category.new(name: "Furniture") }
      let(:category_duplicate) { Category.new(name: "Books") }
      let(:category_invalid_uniqueness) { Category.new(name: "Furniture") }
      let(:category_invalid_name) { Category.new(name: "") }
      let(:category_invalid_length) { Category.new(name: "Air Conditioner") }
      let(:category_invalid_format) { Category.new(name: "Furniture2") }
      
      it "category having a name should be valid" do
        expect(category).to be_valid
      end

      it "category having no name should be invalid" do
        expect(category_invalid_name).not_to be_valid
      end 
      
      it "category having name of length within 2 and 14 characters should be valid" do
        expect(category).to be_valid
      end

      it "category not having name of length within 2 and 14 characters should be invalid" do
        expect(category_invalid_length).not_to be_valid
      end 
      
      it "categories having unique names is valid" do
        expect(category_duplicate.name).not_to eq(category.name)
      end

      it "categories not having unique names is invalid" do
        expect(category_invalid_uniqueness.name).to eq(category.name)
      end
      
      it "categories containing name with uppercase, lowercase letters and blank spaces are valid" do
        expect(category).to be_valid
      end

      it "categories containing name with digits or special characters is invalid" do
        expect(category_invalid_format).not_to be_valid
      end
    end  
  end
end
