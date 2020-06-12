require 'rails_helper'

RSpec.describe Review, type: :model do
  subject {
    described_class.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1)
  }
  context "validations" do
    describe ".name" do
      it "review having a reviewer name is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "review having no reviewer name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end
      it "review having reviewer name of length within 2 and 30 characters is valid" do
        subject = create(:post2)
        expect(subject).to be_valid
      end
      it "review not having reviewer name of length within 2 and 30 characters is invalid" do
        subject.name = "S"
        expect(subject).not_to be_valid
      end 
      it "review containing reviewer name with uppercase, lowercase letters and blank spaces is valid" do
        subject = create(:post3)
        expect(subject).to be_valid
      end
      it "review containing reviewer name with digits or special characters is invalid" do
        subject.name = "S-s"
        expect(subject).not_to be_valid
      end
    end
    
    describe ".email" do
      it "review having a email is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "review having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
      it "review having email of length within 5 and 80 characters is valid" do
        subject = create(:post2)
        expect(subject).to be_valid
      end
      it "review not having email of length within 5 and 80 characters is invalid" do
        subject.email = "g.in"
        expect(subject).not_to be_valid
      end 
      it "review containing email with the format ______@_____._____ is valid" do
        subject = create(:post3)
        expect(subject).to be_valid
      end
      it "review not containing email with the format ______@_____._____ is invalid" do
        subject.email = "someone.com"
        expect(subject).not_to be_valid
      end
    end

    describe ".location" do
      it "review having a reviewer location is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "review having no reviewer location is invalid" do
        subject.location = ""
        expect(subject).not_to be_valid
      end
      it "review having reviewer location of length within 2 and 30 characters is valid" do
        subject = create(:post2)
        expect(subject).to be_valid
      end
      it "review not having reviewer location of length within 2 and 30 characters is invalid" do
        subject.location = "s"
        expect(subject).not_to be_valid
      end 
      it "review containing reviewer location with uppercase, lowercase letters and blank spaces is valid" do
        subject = create(:post3)
        expect(subject).to be_valid
      end
      it "review containing reviewer location with digits or special characters is invalid" do
        subject.location = "somewhere1"
        expect(subject).not_to be_valid
      end
    end

    describe ".review" do
      it "review having a content is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "review having no content is invalid" do
        subject.review = ""
        expect(subject).not_to be_valid
      end
      it "review having content with length of minimum 1 character is valid" do
        subject = create(:post2)
        expect(subject).to be_valid
      end
      it "review not having content with length of minimum 1 character is invalid" do
        subject.review = ""
        expect(subject).not_to be_valid
      end
    end

    describe "#rating" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_rating) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "", post_id: 1) }
      
      it "review having a rating is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "review having no rating is invalid" do
        subject.rating = ""
        expect(subject).not_to be_valid
      end
    end

    describe "#post_id" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_missing_post_id) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5") }
      
      it "review associated with a post is valid" do
        subject = create(:post1)
        expect(subject).to be_valid
      end
      it "review not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  context "associations" do
    it { is_expected.to belong_to :post }
  end  
end
