require "rails_helper"

RSpec.describe AdMailer, type: :mailer do
  let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
  let(:user1) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
  let(:user2) { User.new(name: "Someone", email: "someone2@gmail.com", password: "11111111") }

  context "mailer_methods" do
    describe "#post_approved" do
      let(:mail) { AdMailer.post_approved(post, user1) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Your post has been approved")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Your post has been rejected")
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

    describe "#post_rejected" do
      let(:mail) { AdMailer.post_rejected(post, user1) }
      it "mail rendering the correct subject is valid" do
        expect(mail.subject).to eq("Your post has been rejected")
      end
      it "mail not rendering the correct subject is invalid" do
        expect(mail.subject).not_to eq("Your post has been approved")
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
