require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    describe ".name" do
      let(:user) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
      let(:user_invalid_name) { User.new(name: "", email: "someone@gmail.com", password: "11111111") }
      let(:user_invalid_name_length) { User.new(name: "S", email: "someone@gmail.com", password: "11111111") }
      let(:user_invalid_name_format) { User.new(name: "Someone1", email: "someone@gmail.com", password: "11111111") }

      it "user having a name is valid" do
        expect(user).to be_valid
      end
      it "user having no name is invalid" do
        expect(user_invalid_name).not_to be_valid
      end
      it "user having name of length within 2 and 30 characters is valid" do
        expect(user).to be_valid
      end
      it "user not having name of length within 2 and 30 characters is invalid" do
        expect(user_invalid_name_length).not_to be_valid
      end 
      it "user containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(user).to be_valid
      end
      it "user containing name with digits or special characters is invalid" do
        expect(user_invalid_name_format).not_to be_valid
      end
    end

    describe ".email" do
      let(:user) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
      let(:user_duplicate) { User.new(name: "Someone", email: "some@gmail.com", password: "11111111") }
      let(:user_invalid_uniqueness) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
      let(:user_invalid_email) { User.new(name: "Someone", email: "", password: "11111111") }
      let(:user_invalid_email_length) { User.new(name: "Someone", email: "g.in", password: "11111111") }
      let(:user_invalid_email_format) { User.new(name: "Someone", email: "someone.com", password: "11111111") }

      it "user having an email is valid" do
        expect(user).to be_valid
      end
      it "user having no email is invalid" do
        expect(user_invalid_email).not_to be_valid
      end
      it "user having email of length within 5 and 80 characters is valid" do
        expect(user).to be_valid
      end
      it "user not having email of length within 5 and 80 characters is invalid" do
        expect(user_invalid_email_length).not_to be_valid
      end 
      it "user having unique email is valid" do
        expect(user_duplicate.email).not_to eq(user.email)
      end
      it "user not having unique email is invalid" do
        expect(user_invalid_uniqueness.email).to eq(user.email)
      end
      it "user containing email with the format ______@_____._____is valid" do
        expect(user).to be_valid
      end
      it "user not containing email with the format ______@_____._____ is invalid" do
        expect(user_invalid_email_format).not_to be_valid
      end
    end

    describe "#password" do
      let(:user) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
      let(:user_invalid_password) { User.new(name: "Someone", email: "someone@gmail.com", password: "") }
      let(:user_invalid_password_length) { User.new(name: "Someone", email: "someone@gmail.com", password: "1111") }
      
      it "user having a password is valid" do
        expect(user).to be_valid
      end
      it "user having no password is invalid" do
        expect(user_invalid_password).not_to be_valid
      end
      it "user having password of length within 6 and 30 characters is valid" do
        expect(user).to be_valid
      end
      it "user not having name of length within 6 and 30 characters is invalid" do
        expect(user_invalid_password_length).not_to be_valid
      end
    end
  end
end
