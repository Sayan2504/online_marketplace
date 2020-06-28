require "rails_helper"

RSpec.describe PostMailer, type: :mailer do
  let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
  let(:user1) { User.new(name: "Someone", email: "someone@gmail.com", password: "11111111") }
  let(:user2) { User.new(name: "Someone", email: "someone2@gmail.com", password: "11111111") }
  let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1, approved_by: "null") }
  let(:review_mail) { PostMailer.review(user1, review, post) }
  let(:post_approved_mail) { PostMailer.post_approved(post, user1) }
  let(:post_rejected_mail) { PostMailer.post_rejected(post, user1) }

  #"review" mailer tests
  describe "#review_subject" do
    context "when correct subject rendered" do
      it "mail rendering the correct subject is valid" do
        expect(review_mail.subject).to eq("You got a review on your post")
      end
    end
    context "when incorrect subject rendered" do
      it "mail not rendering the correct subject is invalid" do
        expect(review_mail.subject).not_to eq("You got no review on your post")
      end
    end
  end

  describe "#review_recipient" do
    context "with correct recipient" do
      it "mail forwarded to the correct recipient is valid" do
        expect(review_mail.to).to eq([user1.email])
      end
    end
    context "with incorrect recipient" do
      it "mail not forwarded to the correct recipient is invalid" do
        expect(review_mail.to).not_to eq([user2.email])
      end
    end
  end

  describe "#review_sender" do
    context "with correct sender" do
      it "mail forwarded from the correct sender is valid" do
        expect(review_mail.from).to eq("Online Marketplace")
      end
    end
    context "with incorrect sender" do
      it "mail not forwarded from the correct sender is invalid" do
        expect(review_mail.from).not_to eq("My Online Marketplace")
      end
    end
  end

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
