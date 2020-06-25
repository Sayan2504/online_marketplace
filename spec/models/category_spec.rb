require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new(name: "Furniture") }
  context "validations" do
    describe ".name" do
      let(:category_duplicate) { Category.new(name: "Books") }
      let(:category_invalid_uniqueness) { Category.new(name: "Furniture") }
      
      it "category having a name is valid" do
        expect(subject).to be_valid
      end
      it "category having no name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end 
      it "category having name of length within 2 and 14 characters is valid" do
        expect(subject).to be_valid
      end
      it "category not having name of length within 2 and 14 characters is invalid" do
        subject.name = "Air Conditioner"
        expect(subject).not_to be_valid
      end 
      it "category having unique name is valid" do
        expect(category_duplicate.name).not_to eq(subject.name)
      end
      it "category not having unique name is invalid" do
        expect(category_invalid_uniqueness.name).to eq(subject.name)
      end
      it "category containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
      it "category containing name with digits or special characters is invalid" do
        subject.name = "Furniture2"
        expect(subject).not_to be_valid
      end
    end  
  end

  context "associations" do
    it { is_expected.to have_and_belong_to_many :users }
    it { is_expected.to have_many :posts }
  end 
end
