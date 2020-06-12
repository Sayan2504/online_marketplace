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
      
      it "category having a name is valid" do
        expect(category).to be_valid
      end
      it "category having no name is invalid" do
        expect(category_invalid_name).not_to be_valid
      end 
      it "category having name of length within 2 and 14 characters is valid" do
        expect(category).to be_valid
      end
      it "category not having name of length within 2 and 14 characters is invalid" do
        expect(category_invalid_length).not_to be_valid
      end 
      it "category having unique name is valid" do
        expect(category_duplicate.name).not_to eq(category.name)
      end
      it "category not having unique name is invalid" do
        expect(category_invalid_uniqueness.name).to eq(category.name)
      end
      it "category containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(category).to be_valid
      end
      it "category containing name with digits or special characters is invalid" do
        expect(category_invalid_format).not_to be_valid
      end
    end  
  end

  context "associations" do
    it "one category can have many user posts and many category can belong to a common particular user post" do
      expect(Category.reflect_on_association(:users).macro).to eq :has_and_belongs_to_many
    end
    it "one category can have many posts" do
      expect(Category.reflect_on_association(:posts).macro).to eq :has_many
    end
  end 
end
