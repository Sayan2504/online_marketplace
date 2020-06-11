require 'rails_helper'

RSpec.describe Buyer, type: :model do
  context "validations" do
    describe ".buyer_name" do
      it "buyer having a name should be valid" do
        buyer = Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1).save
        expect(buyer).to eq(true)
      end
      it "buyer having no name should be invalid" do
        buyer = Buyer.new(buyer_name: "", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1).save
        expect(buyer).to eq(false)
      end 
      
      it "buyer having name of length within 2 and 30 characters should be valid" do
        buyer = Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1).save
        expect(buyer).to eq(true)
      end

      it "buyer not having name of length within 2 and 14 characters should be invalid" do
        buyer = Buyer.new(buyer_name: "S", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1).save
        expect(buyer).to eq(false)
      end 
      
      it "buyer containing name with uppercase, lowercase letters and blank spaces are valid" do
        buyer = Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1).save
        expect(buyer).to eq(true)
      end

      it "buyer containing name with digits or special characters is invalid" do
        buyer = Buyer.new(buyer_name: "Someone2", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1).save
        expect(buyer).to eq(false)
      end
    end  
  end  
end
