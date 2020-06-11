require 'rails_helper'

RSpec.describe Buyer, type: :model do
  context "validations" do
    describe ".buyer_name" do
      let(:buyer) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_name) { Buyer.new(buyer_name: "", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_length) { Buyer.new(buyer_name: "S", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_format) { Buyer.new(buyer_name: "Someone2", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }

      it "buyer having a name is valid" do
        buyer = create(:buyer1)
        expect(buyer).to be_valid
      end
      it "buyer having no name is invalid" do
        expect(buyer_invalid_name).not_to be_valid
      end
      it "buyer having name of length within 2 and 30 characters is valid" do
        buyer = create(:buyer2)
        expect(buyer).to be_valid
      end
      it "buyer not having name of length within 2 and 14 characters is invalid" do
        expect(buyer_invalid_length).not_to be_valid
      end 
      it "buyer containing name with uppercase, lowercase letters and blank spaces is valid" do
        buyer = create(:buyer3)
        expect(buyer).to be_valid
      end
      it "buyer containing name with digits or special characters is invalid" do
        expect(buyer_invalid_format).not_to be_valid
      end
    end 
    
    describe ".email" do
      let(:buyer) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_email) { Buyer.new(buyer_name: "Someone", email: "", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_length) { Buyer.new(buyer_name: "Someone", email: "g.in", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_format) { Buyer.new(buyer_name: "Someone", email: "someone.com", location: "somewhere", post_id: 1, user_id: 1) }

      it "buyer having an email is valid" do
        buyer = create(:buyer1)
        expect(buyer).to be_valid
      end
      it "buyer having no email is invalid" do
        expect(buyer_invalid_email).not_to be_valid
      end
      it "buyer having email of length within 5 and 80 characters is valid" do
        buyer = create(:buyer2)
        expect(buyer).to be_valid
      end
      it "buyer not having email of length within 5 and 80 characters is invalid" do
        expect(buyer_invalid_length).not_to be_valid
      end  
      it "buyer containing email with the format ______@_____._____ is valid" do
        buyer = create(:buyer3)
        expect(buyer).to be_valid
      end
      it "buyer not containing email with the format ______@_____._____ is invalid" do
        expect(buyer_invalid_format).not_to be_valid
      end
    end

    describe ".location" do
      let(:buyer) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_invalid_location) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "", post_id: 1, user_id: 1) }
      let(:buyer_invalid_length) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "s", post_id: 1, user_id: 1) }
      let(:buyer_invalid_format) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere2", post_id: 1, user_id: 1) }

      it "buyer having a location is valid" do
        buyer = create(:buyer1)
        expect(buyer).to be_valid
      end
      it "buyer having no location is invalid" do
        expect(buyer_invalid_location).not_to be_valid
      end
      it "buyer having location name of length within 2 and 30 characters is valid" do
        buyer = create(:buyer2)
        expect(buyer).to be_valid
      end
      it "buyer not having location name of length within 2 and 30 characters is invalid" do
        expect(buyer_invalid_length).not_to be_valid
      end  
      it "buyer containing location name with uppercase, lowercase letters and blank spaces is valid" do
        buyer = create(:buyer3)
        expect(buyer).to be_valid
      end
      it "buyer not containing location name with digits or special characters is invalid" do
        expect(buyer_invalid_format).not_to be_valid
      end
    end 

    describe "#post_id" do
      let(:buyer) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_missing_post) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "", user_id: 1) }
      
      it "buyer associated with a post is valid" do
        buyer = create(:buyer1)
        expect(buyer).to be_valid
      end
      it "buyer not associated with a post is invalid" do
        expect(buyer_missing_post).not_to be_valid
      end
    end

    describe "#user_id" do
      let(:buyer) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
      let(:buyer_missing_user) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "", post_id: 1) }
      
      it "buyer associated with an user is valid" do
        buyer = create(:buyer1)
        expect(buyer).to be_valid
      end
      it "buyer not associated with an user is invalid" do
        expect(buyer_missing_user).not_to be_valid
      end
    end
  end  
end
