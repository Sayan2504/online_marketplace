require "rails_helper"

RSpec.describe AdMailer, type: :mailer do
  let(:post) { create(:post) }
  let(:user1) { create(:userduplicate) }
  let(:user2) { create(:usernew) }
  let(:post_approved_mail) { AdMailer.post_approved(post, user1) }
  let(:post_rejected_mail) { AdMailer.post_rejected(post, user1) }

  #"post_approved" mailer tests
  describe "#post_approved_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(post_approved_mail.subject).to eq("Your post has been approved")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(post_approved_mail.subject).not_to eq("Your post has been rejected")
      end
    end
  end

  describe "#post_approved_recipient" do
    context "with correct recipient" do  
      it "mail forwarded to the correct recipient is valid" do
        expect(post_approved_mail.to).to eq([user1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(post_approved_mail.to).not_to eq([user2.email])
      end
    end
  end

  describe "#post_approved_sender" do
    context "with correct sender" do  
      it "mail forwarded from the correct sender is valid" do
        expect(post_approved_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(post_approved_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end

  #"post_rejected" mailer tests
  describe "#post_rejected_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(post_rejected_mail.subject).to eq("Your post has been rejected")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(post_rejected_mail.subject).not_to eq("Your post has been approved")
      end
    end
  end

  describe "#post_rejected_recipient" do
    context "with correct recipient" do   
      it "mail forwarded to the correct recipient is valid" do
        expect(post_rejected_mail.to).to eq([user1.email])
      end
    end
    context "with incorrect recipient" do 
      it "mail not forwarded to the correct recipient is invalid" do
        expect(post_rejected_mail.to).not_to eq([user2.email])
      end
    end
  end

  describe "#post_rejected_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(post_rejected_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(post_rejected_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end
end
