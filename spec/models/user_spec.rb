require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Someone", email: "someone@gmail.com", password: "11111111")
  }
  context "validations" do
    describe ".name" do
      it "user having a name is valid" do
        expect(subject).to be_valid
      end
      it "user having no name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end
      it "user having name of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
      it "user not having name of length within 2 and 30 characters is invalid" do
        subject.name = "S"
        expect(subject).not_to be_valid
      end 
      it "user containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
      it "user containing name with digits or special characters is invalid" do
        subject.name = "Someone1"
        expect(subject).not_to be_valid
      end
    end

    describe ".email" do
      let(:user_duplicate) { User.new(name: "Someone", email: "some@gmail.com", password: "11111111") }
      let(:user_invalid_uniqueness) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
      
      it "user having an email is valid" do
        expect(subject).to be_valid
      end
      it "user having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
      it "user having email of length within 5 and 80 characters is valid" do
        expect(subject).to be_valid
      end
      it "user not having email of length within 5 and 80 characters is invalid" do
        subject.email = "g.in"
        expect(subject).not_to be_valid
      end 
      it "user having unique email is valid" do
        expect(subject).not_to eq(subject.email)
      end
      it "user not having unique email is invalid" do
        expect(user_invalid_uniqueness.email).to eq(subject.email)
      end
      it "user containing email with the format ______@_____._____is valid" do
        expect(subject).to be_valid
      end
      it "user not containing email with the format ______@_____._____ is invalid" do
        subject.email = "someone.com"
        expect(subject).not_to be_valid
      end
    end

    describe "#password" do
      it "user having a password is valid" do
        expect(subject).to be_valid
      end
      it "user having no password is invalid" do
        subject.password = nil
        expect(subject).not_to be_valid
      end
      it "user having password of length within 6 and 30 characters is valid" do
        expect(subject).to be_valid
      end
      it "user not having password of length within 6 and 30 characters is invalid" do
        subject.password = "1111"
        expect(subject).not_to be_valid
      end
    end
  end

  context "associations" do
    it { is_expected.to have_many :posts }   
    it { is_expected.to have_many :messages } 
    it { is_expected.to have_and_belong_to_many :categories }  
    it { is_expected.to have_one :buyer }
    it { is_expected.to have_many :post_attachments }
    it { is_expected.to have_many :reviews }
  end  
end
