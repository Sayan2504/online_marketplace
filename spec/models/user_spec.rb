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
    it "one user can have many posts" do
      user = create(:user1)
      expect(user.posts.count).to eq(2)
    end 
    it "one user can have many messages" do
      expect(User.reflect_on_association(:messages).macro).to eq :has_many
    end
    it "one user post can have many post categories and many users can belong to a common particular post category" do
      expect(User.reflect_on_association(:categories).macro).to eq :has_and_belongs_to_many
    end
    it "one user should be one particular buyer" do
      expect(User.reflect_on_association(:buyer).macro).to eq :has_one
    end
    it "one user can have many posts each of which can have many post attachments" do
      expect(User.reflect_on_association(:post_attachments).macro).to eq :has_many
    end
    it "one user can have many posts each of which can have many reviews" do
      expect(User.reflect_on_association(:reviews).macro).to eq :has_many
    end   
  end  
end
