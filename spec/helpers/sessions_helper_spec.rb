require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  context "helper_methods" do
    describe "#login" do
      let (:user1) { create(:admin) }
      let (:user2) { create(:admin2) }
      it "is expected to return valid session user id" do
        helper.log_in(user1)
        expect(session[:user_id]).to eq(user1.id)
      end
      it "is expected to return invalid session user id" do
        helper.log_in(user1)
        expect(session[:user_id]).not_to eq(user2.id)
      end
    end

    describe "#current_user" do
      let (:user1) { create(:admin) }
      it "is expected to return current_user id" do
        helper.log_in(user1)
        expect(helper.current_user.id).to eq(user1.id)
      end
      it "is expected not to return current_user id" do
        helper.log_in(user1)
        expect(helper.current_user.id).not_to eq(nil)
      end
    end

    describe "#admin_user?" do
      let (:user1) { create(:admin) }
      let (:user2) { create(:user) }
      it "is expected to be valid if user is admin" do
        helper.log_in(user1)
        expect(helper.current_user.admin).to eq(true)
      end
      it "is expected to be invalid if user is not admin" do
        helper.log_in(user2)
        expect(helper.current_user.admin).not_to eq(true)
      end
    end

    describe "#logout" do
      let (:user1) { create(:admin) }
      it "is expected to be valid if user logs out" do
        helper.log_out
        expect(session[:user_id]).to eq(nil)
      end
      it "is expected to be invalid if user does not log out" do
        helper.log_out
        expect(session[:user_id]).not_to eq(user1.id)
      end
    end

    describe "#logged_in?" do
      let (:user1) { create(:admin) }
      it "is expected to be valid if user is logged in" do
        helper.log_in(user1)
        expect(helper.current_user.id).to eq(user1.id)
      end
      it "is expected to be invalid if user is not logged in" do
        helper.log_in(user1)
        expect(session[:user_id]).not_to eq(nil)
      end
    end
  end  
end
