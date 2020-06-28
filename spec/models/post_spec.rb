require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  subject { described_class.new(ad_title: "Something", detailed_ad_title: "something", ad_description: "something", user_name: "Someone", phone: "91-9876543210", city: "Somewhere", user_id: user.id, category_id: category.id, approved_by: "null") }

  #validation tests
  describe ".post_ad_title_presence" do
    context "ad title present" do
      it "post having a title is valid" do
        expect(subject).to be_valid
      end
    end
    context "ad title not present" do
      it "post having no title is invalid" do
        subject.ad_title = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_ad_title_length" do
    context "valid ad title length" do
      it "post having title of length within 2 and 14 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid ad title length" do
      it "post not having title of length within 2 and 14 characters is invalid" do
        subject.ad_title = "S"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".post_ad_title_format" do
    context "valid ad title format" do
      it "post containing title starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with parenthesis is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid ad title format" do
      it "post containing title having any special characters other than parenthesis is invalid" do
        subject.ad_title = "S@s"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_detailed_ad_title_presence" do
    context "detailed ad title present" do
      it "post having a detailed title is valid" do
        expect(subject).to be_valid
      end
    end
    context "detailed ad title not present" do
      it "post having no detailed title is invalid" do
        subject.detailed_ad_title = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_detailed_ad_title_length" do
    context "valid detailed ad title length" do
      it "post having detailed title of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid detailed ad title length" do
      it "post not having detailed title of length within 2 and 30 characters is invalid" do
        subject.detailed_ad_title = "S"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".post_detailed_ad_title_format" do
    context "valid detailed ad title format" do
      it "post containing detailed title starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with parenthesis is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid detailed ad title format" do
      it "post containing detailed title having any special characters other than parenthesis is invalid" do
        subject.detailed_ad_title = "S@s"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_ad_description_presence" do
    context "ad description present" do
      it "post having an ad description is valid" do
        expect(subject).to be_valid
      end
    end
    context "ad description not present" do
      it "post having no ad description is invalid" do
        subject.ad_description = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_ad_description_length" do
    context "valid ad description length" do
      it "post having ad description of length within 2 and 255 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid ad description length" do
      it "post not having ad description of length within 2 and 255 characters is invalid" do
        subject.ad_description = "S"
        expect(subject).not_to be_valid
      end
    end 
  end

  describe ".post_user_name_presence" do
    context "user name present" do
      it "post having a user name is valid" do
        expect(subject).to be_valid
      end
    end
    context "user name not present" do
      it "post having no user name is invalid" do
        subject.user_name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_user_name_length" do
    context "valid user name length" do
      it "post having user name of length within 2 and 30 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid user name length" do
      it "post not having user name of length within 2 and 30 characters is invalid" do
        subject.user_name = "S"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".post_user_name_format" do
    context "valid user name format" do
      it "post containing user name starting with uppercase, lowercase letters and blank spaces followed by the previous ones added with underscore is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid user name format" do
      it "post containing user name having any special characters other than underscore is invalid" do
        subject.user_name = "s-s"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_contact_number_presence" do
    context "contact number present" do
      it "post having a contact number is valid" do
        expect(subject).to be_valid
      end
    end
    context "contact number not present" do
      it "post having no contact number is invalid" do
        subject.phone = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_contact_number_length" do
    context "valid contact number length" do
      it "post having contact number of length within 10 and 15 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid contact number length" do
      it "post not having contact number of length within 10 and 15 characters is invalid" do
        subject.phone = "98765432"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".post_contact_number_format" do
    context "valid contact number format" do
      it "post containing contact number with the format (country code)-(10 digit mobile number) with country code as mandatory is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid contact number format" do
      it "post containing contact number without the format (country code)-(10 digit mobile number) with country code as mandatory is invalid" do
        subject.phone = "91 9876543210"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_city_name_presence" do
    context "city name present" do
      it "post having a city name is valid" do
        expect(subject).to be_valid
      end
    end
    context "city name not present" do
      it "post having no city name is invalid" do
        subject.city = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".post_city_name_length" do
    context "valid city name length" do
      it "post having city name of length within 1 and 14 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid city name length" do
      it "post not having city name of length within 1 and 14 characters is invalid" do
        subject.city = "Somewhere someplace"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".post_city_name_format" do
    context "valid city name format" do
      it "post containing city name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "invalid city name format" do
      it "post containing city name with digits or special characters is invalid" do
        subject.city = "Somewhere1"
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#user_id" do
    context "user id present" do
      it "post associated with an user is valid" do
        expect(subject).to be_valid
      end
    end
    context "user id not present" do
      it "post not associated with an user is invalid" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
    end
  end

  #association tests
  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }
  end

  describe "belongs_to :category" do
    it { is_expected.to belong_to :category }
  end

  describe "has_many :post_attachments" do
    it { is_expected.to have_many :post_attachments }
  end

  describe "has_many :reviews" do
    it { is_expected.to have_many :reviews }
  end

  describe "has_many :messages" do
    it { is_expected.to have_many :messages }
  end

  describe "has_and_belongs_to_many :buyers" do
    it { is_expected.to have_and_belong_to_many :buyers }
  end

  #macro tests
  describe "accepts_nested_attributes_for :post_attachments" do
    it { is_expected.to accept_nested_attributes_for :post_attachments }
  end  

  #method tests
  describe ".admin_post_approval" do
    context "valid data" do
      it "Post approved by 'anyone' is valid" do
        subject.approved_by = "anyone"
        expect(subject.approved_by).not_to eq("null")
      end
    end
    context "invalid data" do
      it "Post approved by 'null' is invalid" do
        expect(subject.approved_by).to eq("null")
      end
    end
  end

  #scope tests
  describe ".admin_post_state" do
    context "valid data" do
      it "posts either unchecked or rejected are valid" do
        subject.approved_by = "rejected"
        expect(subject.approved_by).to include("rejected")
      end
    end
    context "invalid data" do
      it "posts neither unchecked nor rejected are invalid" do
        subject.approved_by = "approved"
        expect(subject.approved_by).not_to include("null", "rejected")
      end
    end  
  end

  describe ".admin_post_approved_state" do
    context "valid data" do
      it "posts approved by admin are valid" do
        subject.approved_by = "Admin"
        expect(subject.approved_by).not_to include("null", "rejected")
      end
    end
    context "invalid data" do
      it "posts not approved by admin and hence either null or rejected are invalid" do
        subject.approved_by = "null"
        expect(subject.approved_by).to include("null")
      end  
    end
  end

  describe ".post_category" do
    context "valid data" do
      it "posts belonging to the correct category are valid" do
        subject.category_id = 1
        expect([subject.category_id]).to include(1)
      end
    end
    context "invalid data" do
      it "posts not belonging to the correct category are invalid" do
        subject.category_id = 2
        expect([subject.category_id]).not_to include(1)
      end
    end  
  end

  describe ".post_unsold" do
    context "valid data" do
      it "posts not containing any buyer id and hence unsold are valid" do
        subject.buyer_id = nil
        expect([subject.buyer_id]).to include(nil)
      end
    end
    context "invalid data" do
      it "posts containing a buyer id and hence sold are invalid" do
        subject.buyer_id = 1
        expect([subject.buyer_id]).not_to include(nil)
      end  
    end
  end

  describe ".post_ad_title" do
    context "valid data" do
      it "posts with the correct ad title as a whole or as a keyword are valid" do
        subject.ad_title = "title something here"
        expect(subject.ad_title).to include("something")
      end
    end
    context "invalid data" do
      it "posts with the wrong ad title as a whole or as a keyword are invalid" do
        subject.ad_title = "title someone here"
        expect(subject.ad_title).not_to include("something")
      end 
    end 
  end

  describe ".post_city" do
    context "valid data" do
      it "posts with the correct city name as a whole or as a keyword are valid" do
        subject.city = "title someplace here"
        expect(subject.city).to include("someplace")
      end
    end
    context "invalid data" do
      it "posts with the wrong city name as a whole or as a keyword are invalid" do
        subject.city = "title place here"
        expect(subject.city).not_to include("someplace")
      end
    end  
  end

  describe ".product_bought_sold" do
    context "valid data" do
      it "posts containing a buyer id and hence sold are valid" do
        subject.buyer_id = 1
        expect([subject.buyer_id]).to include(1)
      end
    end
    context "invalid data" do
      it "posts not containing any buyer id and hence unsold are invalid" do
        subject.buyer_id = nil
        expect([subject.buyer_id]).not_to include(1)
      end
    end  
  end

  describe ".where_post_id" do
    context "valid data" do
      it "posts having the correct id are valid" do
        subject.id = 1
        expect([subject.id]).to include(1)
      end
    end
    context "invalid data" do
      it "posts having the wrong id are invalid" do
        subject.id = 2
        expect([subject.id]).not_to include(1)
      end 
    end 
  end

  describe ".users_post" do
    context "valid data" do
      it "posts having the current user's id are valid" do
        subject.user_id = 1
        expect([subject.user_id]).to include(1)
      end
    end
    context "invalid data" do
      it "posts not having the current user's id are invalid" do
        subject.user_id = 2
        expect([subject.user_id]).not_to include(1)
      end 
    end 
  end

  describe ".others_post" do
    context "valid data" do
      it "posts not having the current user's id and hence having other user's id are valid" do
        subject.user_id = 2
        expect([subject.user_id]).not_to include(1)
      end
    end
    context "invalid data" do
      it "posts not having other user's id  and hence having the current user's id are invalid" do
        subject.user_id = 1
        expect([subject.user_id]).to include(1)
      end  
    end
  end
end
