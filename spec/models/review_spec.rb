require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations" do
    describe ".name" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_name) { Review.new(name: "", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_length) { Review.new(name: "S", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_format) { Review.new(name: "S-s", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }

      it "review having a reviewer name is valid" do
        review = create(:review1)
        expect(review).to be_valid
      end
      it "review having no reviewer name is invalid" do
        expect(review_invalid_name).not_to be_valid
      end
      it "review having reviewer name of length within 2 and 30 characters is valid" do
        review = create(:review2)
        expect(review).to be_valid
      end
      it "review not having reviewer name of length within 2 and 30 characters is invalid" do
        expect(review_invalid_length).not_to be_valid
      end 
      it "review containing reviewer name with uppercase, lowercase letters and blank spaces is valid" do
        review = create(:review3)
        expect(review).to be_valid
      end
      it "review containing reviewer name with digits or special characters is invalid" do
        expect(review_invalid_format).not_to be_valid
      end
    end
    
    describe ".email" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_email) { Review.new(name: "Someone", email: "", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_email_length) { Review.new(name: "Someone", email: "g.in", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_email_format) { Review.new(name: "Someone", email: "someone.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }

      it "review having a email is valid" do
        review = create(:review1)
        expect(review).to be_valid
      end
      it "review having no email is invalid" do
        expect(review_invalid_email).not_to be_valid
      end
      it "review having email of length within 5 and 80 characters is valid" do
        review = create(:review2)
        expect(review).to be_valid
      end
      it "review not having email of length within 5 and 80 characters is invalid" do
        expect(review_invalid_email_length).not_to be_valid
      end 
      it "review containing email with the format ______@_____._____ is valid" do
        review = create(:review3)
        expect(review).to be_valid
      end
      it "review not containing email with the format ______@_____._____ is invalid" do
        expect(review_invalid_email_format).not_to be_valid
      end
    end

    describe ".location" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_location) { Review.new(name: "Someone", email: "someone@gmail.com", location: "", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_location_length) { Review.new(name: "Someone", email: "someone@gmail.com", location: "s", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_location_format) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere1", review: "something", rating: "5", post_id: 1) }

      it "review having a reviewer location is valid" do
        review = create(:review1)
        expect(review).to be_valid
      end
      it "review having no reviewer location is invalid" do
        expect(review_invalid_location).not_to be_valid
      end
      it "review having reviewer location of length within 2 and 30 characters is valid" do
        review = create(:review2)
        expect(review).to be_valid
      end
      it "review not having reviewer location of length within 2 and 30 characters is invalid" do
        expect(review_invalid_location_length).not_to be_valid
      end 
      it "review containing reviewer location with uppercase, lowercase letters and blank spaces is valid" do
        review = create(:review3)
        expect(review).to be_valid
      end
      it "review containing reviewer location with digits or special characters is invalid" do
        expect(review_invalid_location_format).not_to be_valid
      end
    end

    describe ".review" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:invalid_review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "", rating: "5", post_id: 1) }
      let(:invalid_review_length) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "", rating: "5", post_id: 1) }
      
      it "review having a content is valid" do
        review = create(:review1)
        expect(review).to be_valid
      end
      it "review having no content is invalid" do
        expect(invalid_review).not_to be_valid
      end
      it "review having content with length of minimum 1 character is valid" do
        review = create(:review2)
        expect(review).to be_valid
      end
      it "review not having content with length of minimum 1 character is invalid" do
        expect(invalid_review_length).not_to be_valid
      end
    end

    describe "#rating" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_invalid_rating) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "", post_id: 1) }
      
      it "review having a rating is valid" do
        review = create(:review1)
        expect(review).to be_valid
      end
      it "review having no rating is invalid" do
        expect(review_invalid_rating).not_to be_valid
      end
    end

    describe "#post_id" do
      let(:review) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5", post_id: 1) }
      let(:review_missing_post_id) { Review.new(name: "Someone", email: "someone@gmail.com", location: "somewhere", review: "something", rating: "5") }
      
      it "review associated with a post is valid" do
        review = create(:review1)
        expect(review).to be_valid
      end
      it "review not associated with a post is invalid" do
        expect(review_missing_post_id).not_to be_valid
      end
    end
  end
end
