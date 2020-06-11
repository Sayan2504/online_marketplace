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
  end  
end
