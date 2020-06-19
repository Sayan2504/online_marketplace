require "rails_helper"

RSpec.describe BuyerMailer, type: :mailer do
  let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
  let(:user1) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
  let(:user2) { User.new(name: "Someone", email: "someone2@gmail.com", password: "11111111") }
  let(:buyer1) { Buyer.new(buyer_name: "Someone", email: "someone@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
  let(:buyer2) { Buyer.new(buyer_name: "Someone", email: "someone2@gmail.com", location: "somewhere", post_id: 1, user_id: 1) }
  
  context "mailer_methods" do
    describe "#buying_request" do
      let(:mail) { BuyerMailer.buying_request(buyer1, user1, post) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Your post has a new buying request")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Your post has no new buying request")
      end
      it "mail forwarded to the correct recipient is valid" do
        expect(mail.to).to eq([user1.email])
      end
      it "mail not forwarded to the correct recipient is invalid" do
        expect(mail.to).not_to eq([user2.email])
      end
      it "mail forwarded from the correct sender is valid" do
        expect(mail.from).to eq("Online Marketplace")
      end
      it "mail not forwarded from the correct sender is invalid" do
        expect(mail.from).not_to eq("My Online Marketplace")
      end
    end

    describe "#buying_request_sent" do
      let(:mail) { BuyerMailer.buying_request_sent(buyer1, user1, post) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Your buying request has been sent")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Your buying request has not been sent")
      end
      it "mail forwarded to the correct recipient is valid" do
        expect(mail.to).to eq([buyer1.email])
      end
      it "mail not forwarded to the correct recipient is invalid" do
        expect(mail.to).not_to eq([buyer2.email])
      end
      it "mail forwarded from the correct sender is valid" do
        expect(mail.from).to eq("Online Marketplace")
      end
      it "mail not forwarded from the correct sender is invalid" do
        expect(mail.from).not_to eq("My Online Marketplace")
      end
    end

    describe "#sell" do
      let(:mail) { BuyerMailer.sell(buyer1, post, user1) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Your product has been sold")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Your product has not been sold")
      end
      it "mail forwarded to the correct recipient is valid" do
        expect(mail.to).to eq([user1.email])
      end
      it "mail not forwarded to the correct recipient is invalid" do
        expect(mail.to).not_to eq([user2.email])
      end
      it "mail forwarded from the correct sender is valid" do
        expect(mail.from).to eq("Online Marketplace")
      end
      it "mail not forwarded from the correct sender is invalid" do
        expect(mail.from).not_to eq("My Online Marketplace")
      end
    end

    describe "#bought" do
      let(:mail) { BuyerMailer.bought(buyer1, post, user1) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Your buying request has been approved")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Your buying request has not been approved")
      end
      it "mail forwarded to the correct recipient is valid" do
        expect(mail.to).to eq([buyer1.email])
      end
      it "mail not forwarded to the correct recipient is invalid" do
        expect(mail.to).not_to eq([buyer2.email])
      end
      it "mail forwarded from the correct sender is valid" do
        expect(mail.from).to eq("Online Marketplace")
      end
      it "mail not forwarded from the correct sender is invalid" do
        expect(mail.from).not_to eq("My Online Marketplace")
      end
    end
  end
end
