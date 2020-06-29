require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user1) { create(:user3) }
  let(:user2) { create(:user4) }
  let(:mail) { UserMailer.welcome_email(user1) }

  #"welcome_email" mailer tests
  describe "#welcome_email_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Welcome to My Awesome Site")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Welcome to My Awesome website")
      end
    end
  end

  describe "#welcome_email_recipient" do
    context "with correct recipient" do
      it "mail forwarded to the correct recipient is valid" do
        expect(mail.to).to eq([user1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(mail.to).not_to eq([user2.email])
      end
    end
  end

  describe "#welcome_email_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(mail.from).not_to eq("My Online Marketplace")
      end
    end
  end
end
