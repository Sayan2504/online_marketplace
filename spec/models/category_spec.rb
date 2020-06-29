require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category) }

  #validation tests
  describe ".category_name_presence" do
    context "when category name present" do
      it "category having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "when category name not present" do
      it "category having no name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".category_name_length" do
    context "with valid category name length" do
      it "category having name of length within 2 and 14 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid category name length" do
      it "category not having name of length within 2 and 14 characters is invalid" do
        subject.name = "Air Conditioner"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".category_name_uniqueness" do
    let(:category_duplicate) { create(:category3) }
    context "with unique category name" do
      it "category having unique name is valid" do
        expect(category_duplicate.name).not_to eq(subject.name)
      end
    end
    context "with non-unique category name" do
      it "category not having unique name is invalid" do
        subject.name = "Someone again"
        expect(category_duplicate.name).to eq(subject.name)
      end
    end
  end

  describe ".category_name_format" do
    context "with valid category name format" do
      it "category containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid category name format" do
      it "category containing name with digits or special characters is invalid" do
        subject.name = "Furniture2"
        expect(subject).not_to be_valid
      end
    end
  end  

  #association tests
  describe "has_many :posts" do
    it { is_expected.to have_many :posts }
  end
end
