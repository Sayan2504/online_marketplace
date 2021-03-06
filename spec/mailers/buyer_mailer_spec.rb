require "rails_helper"

RSpec.describe BuyerMailer, type: :mailer do
  let(:post) { create(:post) }
  let(:user1) { create(:user3) }
  let(:user2) { create(:admin) }
  let(:buyer1) { create(:buyer2) }
  let(:buyer2) { create(:buyer3) }
  let(:buying_request_mail) { BuyerMailer.buying_request(buyer1, user1, post) }
  let(:buying_request_sent_mail) { BuyerMailer.buying_request_sent(buyer1, user1, post) }
  let(:sell_mail) { BuyerMailer.sell(buyer1, post, user1) }
  let(:bought_mail) { BuyerMailer.bought(buyer1, post, user1) }

  #"buying_request" mailer tests
  describe "#buying_request_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(buying_request_mail.subject).to eq("Your post has a new buying request")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(buying_request_mail.subject).not_to eq("Your post has no new buying request")
      end
    end
  end

  describe "#buying_request_recipient" do
    context "with correct recipient" do 
      it "mail forwarded to the correct recipient is valid" do
        expect(buying_request_mail.to).to eq([user1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(buying_request_mail.to).not_to eq([user2.email])
      end
    end
  end

  describe "#buying_request_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(buying_request_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(buying_request_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end

  #"buying_request_sent" mailer tests
  describe "#buying_request_sent_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(buying_request_sent_mail.subject).to eq("Your buying request has been sent")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(buying_request_sent_mail.subject).not_to eq("Your buying request has not been sent")
      end
    end
  end

  describe "#buying_request_sent_recipient" do
    context "with correct recipient" do
      it "mail forwarded to the correct recipient is valid" do
        expect(buying_request_sent_mail.to).to eq([buyer1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(buying_request_sent_mail.to).not_to eq([buyer2.email])
      end
    end
  end

  describe "#buying_request_sent_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(buying_request_sent_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(buying_request_sent_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end

  #"sell" mailer tests
  describe "#sell_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(sell_mail.subject).to eq("Your product has been sold")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(sell_mail.subject).not_to eq("Your product has not been sold")
      end
    end
  end

  describe "#sell_recipient" do
    context "with correct recipient" do
      it "mail forwarded to the correct recipient is valid" do
        expect(sell_mail.to).to eq([user1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(sell_mail.to).not_to eq([user2.email])
      end
    end
  end

  describe "#sell_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(sell_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(sell_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end

  #"bought" mailer tests
  describe "#bought_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(bought_mail.subject).to eq("Your buying request has been approved")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(bought_mail.subject).not_to eq("Your buying request has not been approved")
      end
    end
  end

  describe "#bought_recipient" do
    context "with correct recipient" do
      it "mail forwarded to the correct recipient is valid" do
        expect(bought_mail.to).to eq([buyer1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(bought_mail.to).not_to eq([buyer2.email])
      end
    end
  end

  describe "#bought_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(bought_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(bought_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end
end
