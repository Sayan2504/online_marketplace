require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user1) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
  let(:user2) { User.new(name: "Someone", email: "someone2@gmail.com", password: "11111111") }

  context "mailer_methods" do
    describe "#welcome_email" do
      let(:mail) { UserMailer.welcome_email(user1) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Welcome to My Awesome Site")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Welcome to My Awesome website")
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
  end
end
