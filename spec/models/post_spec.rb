require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validations" do
    describe ".ad_title" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_title) { Post.new(ad_title: "", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_length) { Post.new(ad_title: "S", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_format) { Post.new(ad_title: "S@s", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }

      it "post having a title is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post having no title is invalid" do
        expect(post_invalid_title).not_to be_valid
      end
      it "post having title of length within 2 and 14 characters is valid" do
        post = create(:post2)
        expect(post).to be_valid
      end
      it "post not having title of length within 2 and 14 characters is invalid" do
        expect(post_invalid_length).not_to be_valid
      end 
      it "post containing title starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with parenthesis is valid" do
        post = create(:post3)
        expect(post).to be_valid
      end
      it "post containing title having any special characters other than parenthesis is invalid" do
        expect(post_invalid_format).not_to be_valid
      end
    end 

    describe ".detailed_ad_title" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_detailed_title) { Post.new(ad_title: "Something", detailed_ad_title: "", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_detailed_length) { Post.new(ad_title: "Something", detailed_ad_title: "s", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_detailed_format) { Post.new(ad_title: "Something", detailed_ad_title: "s@s", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }

      it "post having a detailed title is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post having no detailed title is invalid" do
        expect(post_invalid_detailed_title).not_to be_valid
      end
      it "post having detailed title of length within 2 and 30 characters is valid" do
        post = create(:post2)
        expect(post).to be_valid
      end
      it "post not having detailed title of length within 2 and 30 characters is invalid" do
        expect(post_invalid_detailed_length).not_to be_valid
      end 
      it "post containing detailed title starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with parenthesis is valid" do
        post = create(:post3)
        expect(post).to be_valid
      end
      it "post containing detailed title having any special characters other than parenthesis is invalid" do
        expect(post_invalid_detailed_format).not_to be_valid
      end
    end
    
    describe ".ad_description" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_description) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_description_length) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "s", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      
      it "post having an ad description is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post having no ad description is invalid" do
        expect(post_invalid_description).not_to be_valid
      end
      it "post having ad description of length within 2 and 255 characters is valid" do
        post = create(:post2)
        expect(post).to be_valid
      end
      it "post not having ad description of length within 2 and 255 characters is invalid" do
        expect(post_invalid_description_length).not_to be_valid
      end 
    end

    describe ".user_name" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_username) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_username_length) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "S", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_username_format) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "S-s", phone: "9876543210", city: "Somewhere", user_id: 1) }

      it "post having a user name is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post having no user name is invalid" do
        expect(post_invalid_username).not_to be_valid
      end
      it "post having user name of length within 2 and 30 characters is valid" do
        post = create(:post2)
        expect(post).to be_valid
      end
      it "post not having user name of length within 2 and 30 characters is invalid" do
        expect(post_invalid_username_length).not_to be_valid
      end 
      it "post containing user name starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with underscore is valid" do
        post = create(:post3)
        expect(post).to be_valid
      end
      it "post containing user name having any special characters other than underscore is invalid" do
        expect(post_invalid_username_format).not_to be_valid
      end
    end

    describe ".phone" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_phone) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "", city: "Somewhere", user_id: 1) }
      let(:post_invalid_phone_length) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "98765432", city: "Somewhere", user_id: 1) }
      let(:post_invalid_phone_format) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "91 9876543210", city: "Somewhere", user_id: 1) }

      it "post having a contact number is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post having no contact number is invalid" do
        expect(post_invalid_phone).not_to be_valid
      end
      it "post having contact number of length within 10 and 15 characters is valid" do
        post = create(:post2)
        expect(post).to be_valid
      end
      it "post not having contact number of length within 10 and 15 characters is invalid" do
        expect(post_invalid_phone_length).not_to be_valid
      end 
      it "post containing contact number with the format (country code)-(10 digit mobile number) with country code as optional is valid" do
        post = create(:post3)
        expect(post).to be_valid
      end
      it "post containing contact number without the format (country code)-(10 digit mobile number) with country code as optional is invalid" do
        expect(post_invalid_phone_format).not_to be_valid
      end
    end

    describe ".city" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_city) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "", user_id: 1) }
      let(:post_invalid_city_length) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere someplace", user_id: 1) }
      let(:post_invalid_city_format) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere1", user_id: 1) }

      it "post having a city name is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post having no city name is invalid" do
        expect(post_invalid_city).not_to be_valid
      end
      it "post having city name of length within 1 and 14 characters is valid" do
        post = create(:post2)
        expect(post).to be_valid
      end
      it "post not having city name of length within 1 and 14 characters is invalid" do
        expect(post_invalid_city_length).not_to be_valid
      end 
      it "post containing city name with uppercase, lowercase letters and blank spaces is valid" do
        post = create(:post3)
        expect(post).to be_valid
      end
      it "post containing city name with digits or special characters is invalid" do
        expect(post_invalid_city_format).not_to be_valid
      end
    end

    describe "#user_id" do
      let(:post) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere", user_id: 1) }
      let(:post_invalid_user_id) { Post.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "9876543210", city: "Somewhere") }
      
      it "post associated with an user is valid" do
        post = create(:post1)
        expect(post).to be_valid
      end
      it "post not associated with an user is invalid" do
        expect(post_invalid_user_id).not_to be_valid
      end
    end
  end
end
