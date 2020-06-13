require 'rails_helper'

RSpec.describe Buyer, type: :model do
  subject {
    described_class.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1)
  }
  context "validations" do
    describe ".buyer_name" do
      it "buyer having a name is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "buyer having no name is invalid" do
        subject.buyer_name = ""
        expect(subject).not_to be_valid
      end
      it "buyer having name of length within 2 and 30 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "buyer not having name of length within 2 and 30 characters is invalid" do
        subject.buyer_name = "S"
        expect(subject).not_to be_valid
      end 
      it "buyer containing name with uppercase, lowercase letters and blank spaces is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "buyer containing name with digits or special characters is invalid" do
        subject.buyer_name = "Someone2"
        expect(subject).not_to be_valid
      end
    end 
    describe ".email" do
      it "buyer having an email is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "buyer having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
      it "buyer having email of length within 5 and 80 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "buyer not having email of length within 5 and 80 characters is invalid" do
        subject.email = "g.in"
        expect(subject).not_to be_valid
      end  
      it "buyer containing email with the format ______@_____._____ is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "buyer not containing email with the format ______@_____._____ is invalid" do
        subject.email = "someone.com"
        expect(subject).not_to be_valid
      end
    end
    describe ".location" do
      it "buyer having a location is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "buyer having no location is invalid" do
        subject.location = ""
        expect(subject).not_to be_valid
      end
      it "buyer having location name of length within 2 and 30 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "buyer not having location name of length within 2 and 30 characters is invalid" do
        subject.location = "s"
        expect(subject).not_to be_valid
      end  
      it "buyer containing location name with uppercase, lowercase letters and blank spaces is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "buyer not containing location name with digits or special characters is invalid" do
        subject.location = "somewhere2"
        expect(subject).not_to be_valid
      end
    end 
    describe "#post_id" do
      it "buyer associated with a post is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "buyer not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
    describe "#user_id" do
      it "buyer associated with an user is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "buyer not associated with an user is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end  

  context "associations" do
    it { is_expected.to have_and_belong_to_many :posts }
    it { is_expected.to belong_to :user }
  end

  context "scopes" do
    describe ".buyer_email" do
      it "Buyer with the correct user email is valid" do
        subject.email = "someone@gmail.com"
        expect(subject.email).to include("someone@gmail.com")
      end
      it "Buyer with the wrong user email is invalid" do
        subject.email = "someone2@gmail.com"
        expect(subject.email).not_to include("someone@gmail.com")
      end
    end
    describe ".buyer_post_id" do
      it "Buyer associated with the correct post is valid" do
        subject.post_id = 1
        expect([subject.post_id]).to include(1)
      end
      it "Buyer associated with the wrong post is invalid" do
        subject.post_id = 2
        expect([subject.post_id]).not_to include(1)
      end
    end
    describe ".buyer_user_id" do
      it "Buyer with the correct user id is valid" do
        subject.user_id = 1
        expect([subject.user_id]).to include(1)
      end
      it "Buyer with the wrong user id is invalid" do
        subject.user_id = 2
        expect([subject.user_id]).not_to include(1)
      end
    end
  end
end
