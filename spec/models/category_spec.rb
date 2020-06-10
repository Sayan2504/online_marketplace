require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    describe ".name" do
      it "category having name should be valid" do
        category = Category.new(name: "Furniture").save
        expect(category).to eq(true)
      end

      it "category having no name should be invalid" do
        category = Category.new(name: "").save
        expect(category).to eq(false)
      end 
      
      it "category having name within 2 and 14 characters should be valid" do
        category = Category.new(name: "Furniture").save
        expect(category).to eq(true)
      end

      it "category not having name within 2 and 14 characters should be invalid" do
        category = Category.new(name: "Air Conditioner").save
        expect(category).to eq(false)
      end 
      
      it "categories having unique names is valid" do
        category = Category.new(name: "Books").save
        category = Category.new(name: "Furniture").save
        expect(category).to eq(true)
      end

      it "categories not having unique names is valid" do
        category = Category.new(name: "Books").save
        category = Category.new(name: "Books").save
        expect(category).to eq(false)
      end
      
      it "categories containing name with uppercase, lowercase letters and blank spaces are valid" do
        category = Category.new(name: "Books").save
        expect(category).to eq(true)
      end

      it "categories containing name with digits or special characters is invalid" do
        category = Category.new(name: "Books2").save
        expect(category).to eq(false)
      end
    end  
  end
end
