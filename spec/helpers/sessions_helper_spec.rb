require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let (:user1) { create(:admin) }
  let (:user2) { create(:admin2) }
  let (:user3) { create(:user) }

  describe "#login" do
    context "with valid session user id" do
      it "is expected to return valid session user id" do
        helper.log_in(user1)
        expect(session[:user_id]).to eq(user1.id)
      end
    end
    context "with invalid session user id" do
      it "is expected to return invalid session user id" do
        helper.log_in(user1)
        expect(session[:user_id]).not_to eq(user2.id)
      end
    end
  end

  describe "#current_user" do
    context "when current_user id returned" do
      it "is expected to return current_user id" do
        helper.log_in(user1)
        expect(helper.current_user.id).to eq(user1.id)
      end
    end
    context "when current_user id not returned" do
      it "is expected not to return current_user id" do
        helper.log_in(user1)
        expect(helper.current_user.id).not_to eq(nil)
      end
    end
  end

  describe "#admin_user?" do
    context "when user is admin user" do
      it "is expected to be valid if user is admin" do
        helper.log_in(user1)
        expect(helper.current_user.admin).to eq(true)
      end
    end
    context "when user is non-admin user" do
      it "is expected to be invalid if user is not admin" do
        helper.log_in(user3)
        expect(helper.current_user.admin).not_to eq(true)
      end
    end
  end

  describe "#logout" do
    context "when user logs out" do
      it "is expected to be valid if user logs out" do
        helper.log_out
        expect(session[:user_id]).to eq(nil)
      end
    end
    context "when user does not log out" do
      it "is expected to be invalid if user does not log out" do
        helper.log_out
        expect(session[:user_id]).not_to eq(user1.id)
      end
    end
  end

  describe "#logged_in?" do
    context "when user is logged in" do
      it "is expected to be valid if user is logged in" do
        helper.log_in(user1)
        expect(helper.current_user.id).to eq(user1.id)
      end
    end
    context "when user is not logged in" do
      it "is expected to be invalid if user is not logged in" do
        helper.log_in(user1)
        expect(session[:user_id]).not_to eq(nil)
      end
    end
  end  
end
