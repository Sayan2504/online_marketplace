require 'rails_helper'

RSpec.describe Buyer, type: :model do
  subject { create(:buyer) }

  #validation tests
  describe ".buyer_name_presence" do
    context "buyer name present" do
      it "buyer having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "buyer name not present" do
      it "buyer having no name is invalid" do
        subject.buyer_name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".buyer_name_length" do
    context "valid buyer name length" do
      it "buyer having name of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid buyer name length" do
      it "buyer not having name of length within 2 and 30 characters is invalid" do
        subject.buyer_name = "S"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".buyer_name_format" do
    context "valid buyer name format" do
      it "buyer containing name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid buyer name format" do
      it "buyer containing name with digits or special characters is invalid" do
        subject.buyer_name = "Someone2"
        expect(subject).not_to be_valid
      end
    end
  end    
   
  describe ".buyer_email_presence" do
    context "buyer email present" do
      it "buyer having an email is valid" do
        expect(subject).to be_valid
      end
    end
    context "buyer email not present" do
      it "buyer having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".buyer_email_length" do
    context "valid buyer email length" do
      it "buyer having email of length within 5 and 80 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid buyer email length" do
      it "buyer not having email of length within 5 and 80 characters is invalid" do
        subject.email = "g.in"
        expect(subject).not_to be_valid
      end 
    end
  end
  
  describe ".buyer_email_format" do
    context "valid buyer email format" do
      it "buyer containing email with the format ______@_____._____ is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid buyer email format" do
      it "buyer not containing email with the format ______@_____._____ is invalid" do
        subject.email = "someone.com"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".buyer_location_presence" do
    context "buyer location present" do
      it "buyer having a location is valid" do
        expect(subject).to be_valid
      end
    end
    context "buyer location not present" do
      it "buyer having no location is invalid" do
        subject.location = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".buyer_location_name_length" do
    context "valid buyer location name length" do
      it "buyer having location name of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid buyer location name length" do
      it "buyer not having location name of length within 2 and 30 characters is invalid" do
        subject.location = "s"
        expect(subject).not_to be_valid
      end 
    end
  end
  
  describe ".buyer_location_name_format" do
    context "valid buyer location name format" do
      it "buyer containing location name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid buyer location name format" do
      it "buyer not containing location name with digits or special characters is invalid" do
        subject.location = "somewhere2"
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#post_id_presence" do
    context "post id present" do
      it "buyer associated with a post is valid" do
        expect(subject).to be_valid
      end
    end 
    context "post id not present" do
      it "buyer not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#user_id_presence" do
    context "user id present" do
      it "buyer associated with an user is valid" do
        expect(subject).to be_valid
      end
    end
    context "user id not present" do
      it "buyer not associated with an user is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end 

  #association tests
  describe "has_and_belongs_to_many :posts" do
    it { is_expected.to have_and_belong_to_many :posts }
  end

  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }
  end

  #scope tests
  describe ".buyer_email" do
    context "valid data" do
      it "Buyer details including the correct user email id is valid" do
        subject.email = "someone@gmail.com"
        expect(subject.email).to include("someone@gmail.com")
      end
    end
    context "invalid data" do
      it "Buyer details including the wrong user email id is invalid" do
        subject.email = "someone2@gmail.com"
        expect(subject.email).not_to include("someone@gmail.com")
      end
    end
  end

  describe ".buyer_post_id" do
    context "valid data" do
      it "Buyer associated with the correct post is valid" do
        subject.post_id = 1
        expect([subject.post_id]).to include(1)
      end
    end
    context "invalid data" do
      it "Buyer associated with the wrong post is invalid" do
        subject.post_id = 2
        expect([subject.post_id]).not_to include(1)
      end
    end
  end

  describe ".buyer_user_id" do
    context "valid data" do
      it "Buyer with the correct user id is valid" do
        subject.user_id = 1
        expect([subject.user_id]).to include(1)
      end
    end
    context "invalid data" do
      it "Buyer with the wrong user id is invalid" do
        subject.user_id = 2
        expect([subject.user_id]).not_to include(1)
      end
    end
  end
end
