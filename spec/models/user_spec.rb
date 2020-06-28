require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }

  #validation tests
  describe ".user_name_presence" do
    context "when user name present" do
      it "user having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "when user name not present" do
      it "user having no name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".user_name_length" do
    context "with valid user name length" do
      it "user having name of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid user name length" do
      it "user not having name of length within 2 and 30 characters is invalid" do
        subject.name = "S"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".user_name_format" do
    context "with valid user name format" do
      it "user containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid user name format" do
      it "user containing name with digits or special characters is invalid" do
        subject.name = "Someone1"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".user_email_presence" do
    context "when user email present" do
      it "user having an email is valid" do
        expect(subject).to be_valid
      end
    end
    context "when user email not present" do
      it "user having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".user_email_length" do
    context "with valid user email length" do
      it "user having email of length within 5 and 80 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid user email length" do
      it "user not having email of length within 5 and 80 characters is invalid" do
        subject.email = "g.in"
        expect(subject).not_to be_valid
      end
    end
  end
  
  describe ".user_email_uniqueness" do
    let(:user_duplicate) { User.new(name: "Someone", email: "some@gmail.com", password: "11111111") }
    context "with unique user email" do
      it "user having unique email is valid" do
        expect(user_duplicate.email).not_to eq(subject.email)
      end
    end
    context "with non-unique user email" do
      it "user not having unique email is invalid" do
        subject.email = "some@gmail.com"
        expect(user_duplicate.email).to eq(subject.email)
      end
    end
  end

  describe ".user_email_format" do
    context "with valid user email format" do
      it "user containing email with the format ______@_____._____is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid user email format" do
      it "user not containing email with the format ______@_____._____ is invalid" do
        subject.email = "someone.com"
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#user_password_presence" do
    context "when user password present" do
      it "user having a password is valid" do
        expect(subject).to be_valid
      end
    end
    context "when user password not present" do
      it "user having no password is invalid" do
        subject.password = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#user_password_length" do
    context "with valid user password length" do
      it "user having password of length within 6 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid user password length" do
      it "user not having password of length within 6 and 30 characters is invalid" do
        subject.password = "1111"
        expect(subject).not_to be_valid
      end
    end
  end

  #association tests
  describe "has_many :posts" do
    it { is_expected.to have_many :posts } 
  end
  
  describe "has_many :messages" do
    it { is_expected.to have_many :messages }  
  end
  
  describe "has_one :buyer" do
    it { is_expected.to have_one :buyer }
  end

  describe "has_many :post_attachments, through: :posts" do
    it { is_expected.to have_many :post_attachments }
  end

  describe "has_many :reviews, through: :posts" do
    it { is_expected.to have_many :reviews }
  end  

  describe "has_secure_password" do
    it { is_expected.to have_secure_password }
  end
end
