require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    described_class.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1)
  }
  context "validations" do
    describe ".ad_title" do
      it "post having a title is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post having no title is invalid" do
        subject.ad_title = ""
        expect(subject).not_to be_valid
      end
      it "post having title of length within 2 and 14 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "post not having title of length within 2 and 14 characters is invalid" do
        subject.ad_title = "S"
        expect(subject).not_to be_valid
      end 
      it "post containing title starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with parenthesis is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "post containing title having any special characters other than parenthesis is invalid" do
        subject.ad_title = "S@s"
        expect(subject).not_to be_valid
      end
    end 

    describe ".detailed_ad_title" do
      it "post having a detailed title is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post having no detailed title is invalid" do
        subject.detailed_ad_title = ""
        expect(subject).not_to be_valid
      end
      it "post having detailed title of length within 2 and 30 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "post not having detailed title of length within 2 and 30 characters is invalid" do
        subject.detailed_ad_title = "S"
        expect(subject).not_to be_valid
      end 
      it "post containing detailed title starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with parenthesis is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "post containing detailed title having any special characters other than parenthesis is invalid" do
        subject.detailed_ad_title = "S@s"
        expect(subject).not_to be_valid
      end
    end
    
    describe ".ad_description" do
      it "post having an ad description is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post having no ad description is invalid" do
        subject.ad_description = ""
        expect(subject).not_to be_valid
      end
      it "post having ad description of length within 2 and 255 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "post not having ad description of length within 2 and 255 characters is invalid" do
        subject.ad_description = "S"
        expect(subject).not_to be_valid
      end 
    end

    describe ".user_name" do
      it "post having a user name is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post having no user name is invalid" do
        subject.user_name = ""
        expect(subject).not_to be_valid
      end
      it "post having user name of length within 2 and 30 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "post not having user name of length within 2 and 30 characters is invalid" do
        subject.user_name = "S"
        expect(subject).not_to be_valid
      end 
      it "post containing user name starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with underscore is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "post containing user name having any special characters other than underscore is invalid" do
        subject.user_name = "s-s"
        expect(subject).not_to be_valid
      end
    end

    describe ".phone" do
      it "post having a contact number is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post having no contact number is invalid" do
        subject.phone = ""
        expect(subject).not_to be_valid
      end
      it "post having contact number of length within 10 and 15 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "post not having contact number of length within 10 and 15 characters is invalid" do
        subject.phone = "98765432"
        expect(subject).not_to be_valid
      end 
      it "post containing contact number with the format (country code)-(10 digit mobile number) with country code as optional is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "post containing contact number without the format (country code)-(10 digit mobile number) with country code as optional is invalid" do
        subject.phone = "91 9876543210"
        expect(subject).not_to be_valid
      end
    end

    describe ".city" do
      it "post having a city name is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post having no city name is invalid" do
        subject.city = ""
        expect(subject).not_to be_valid
      end
      it "post having city name of length within 1 and 14 characters is valid" do
        subject = create(:user2)
        expect(subject).to be_valid
      end
      it "post not having city name of length within 1 and 14 characters is invalid" do
        subject.city = "Somewhere someplace"
        expect(subject).not_to be_valid
      end 
      it "post containing city name with uppercase, lowercase letters and blank spaces is valid" do
        subject = create(:user3)
        expect(subject).to be_valid
      end
      it "post containing city name with digits or special characters is invalid" do
        subject.city = "Somewhere1"
        expect(subject).not_to be_valid
      end
    end

    describe "#user_id" do
      it "post associated with an user is valid" do
        subject = create(:user1)
        expect(subject).to be_valid
      end
      it "post not associated with an user is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  context "associations" do
    it "one post belongs to a particular user" do
      expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
    end
    it "one post belongs to a particular category" do
      expect(Post.reflect_on_association(:category).macro).to eq :belongs_to
    end
    it "one post can have many attchments" do
      expect(Post.reflect_on_association(:post_attachments).macro).to eq :has_many
    end
    it "one post can have many reviews" do
      expect(Post.reflect_on_association(:reviews).macro).to eq :has_many
    end
    it "one post can have many messages" do
      expect(Post.reflect_on_association(:messages).macro).to eq :has_many
    end
    it "one post can have many buyers and many posts can belong to a common particular buyer" do
      expect(Post.reflect_on_association(:buyers).macro).to eq :has_and_belongs_to_many
    end
  end
end
