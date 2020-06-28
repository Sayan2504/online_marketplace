require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { create(:review) }
  
  #validation tests
  describe ".reviewer_name_presence" do
    context "when reviewer name present" do
      it "review having a reviewer name is valid" do
        expect(subject).to be_valid
      end
    end
    context "when reviewer name not present" do
      it "review having no reviewer name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".reviewer_name_length" do
    context "with valid reviewer name length" do
      it "review having reviewer name of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid reviewer name length" do
      it "review not having reviewer name of length within 2 and 30 characters is invalid" do
        subject.name = "S"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".reviewer_name_format" do
    context "with valid reviewer name format" do
      it "review containing reviewer name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid reviewer name format" do
      it "review containing reviewer name with digits or special characters is invalid" do
        subject.name = "S-s"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".reviewer_email_presence" do
    context "when reviewer email present" do
      it "review having a email is valid" do
        expect(subject).to be_valid
      end
    end
    context "when reviewer email not present" do
      it "review having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".reviewer_email_length" do
    context "with valid reviewer email length" do
      it "review having email of length within 5 and 80 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid reviewer email length" do
      it "review not having email of length within 5 and 80 characters is invalid" do
        subject.email = "g.in"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".reviewer_email_format" do
    context "with valid reviewer email format" do
      it "review containing email with the format ______@_____._____ is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid reviewer email format" do
      it "review not containing email with the format ______@_____._____ is invalid" do
        subject.email = "someone.com"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".reviewer_location_presence" do
    context "when reviewer location present" do
      it "review having a reviewer location is valid" do
        expect(subject).to be_valid
      end
    end
    context "when reviewer location not present" do
      it "review having no reviewer location is invalid" do
        subject.location = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".reviewer_location_name_length" do
    context "with valid reviewer location name length" do
      it "review having reviewer location of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid reviewer location name length" do
      it "review not having reviewer location of length within 2 and 30 characters is invalid" do
        subject.location = "s"
        expect(subject).not_to be_valid
      end
    end
  end
  
  describe ".reviewer_location_name_format" do
    context "with valid reviewer location name format" do
      it "review containing reviewer location with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid reviewer location name format" do
      it "review containing reviewer location with digits or special characters is invalid" do
        subject.location = "somewhere1"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".review_content_presence" do
    context "when review content present" do
      it "review having a content is valid" do
        expect(subject).to be_valid
      end
    end
    context "when review content not present" do
      it "review having no content is invalid" do
        subject.review = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".review_content_length" do
    context "with valid review content length" do
      it "review having content with length of minimum 1 character is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid review content length" do
      it "review not having content with length of minimum 1 character is invalid" do
        subject.review = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#rating_presence" do
    context "when wrating present" do
      it "review having a rating is valid" do
        expect(subject).to be_valid
      end
    end
    context "hen rating not present" do
      it "review having no rating is invalid" do
        subject.rating = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#post_id_presence" do
    context "when post id present" do
      it "review associated with a post is valid" do
        expect(subject).to be_valid
      end
    end
    context "when post id not present" do
      it "review not associated with a post is invalid" do
        subject.post_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  #association tests
  describe "belongs_to :post" do
    it { is_expected.to belong_to :post }
  end  

  #method tests
  describe ".admin_review_approval" do
    context "with valid data" do
      it "Review approved by 'anyone' is valid" do
        subject.approved_by = "anyone"
        expect(subject.approved_by).not_to eq("null")
      end
    end
    context "with invalid data" do
      it "Review approved by 'nil' is invalid" do
        expect(subject.approved_by).to eq("null")
      end
    end
  end
end