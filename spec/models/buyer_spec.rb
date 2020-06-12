require 'rails_helper'

RSpec.describe Buyer, type: :model do
  subject {
    Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1)
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
    it "one buyer can have many posts and many buyers can belong to a common particular post" do
      expect(Buyer.reflect_on_association(:posts).macro).to eq :has_and_belongs_to_many
    end
    it "one buyer should be one particular user" do
      expect(Buyer.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end 
end
