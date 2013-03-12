require 'spec_helper'

describe "Signup page:" do

  subject { page }


    before { visit signup_path }

    let(:submit) { "Signup" }

    describe " Registering with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe " Registering with valid information" do
      before do
        fill_in "user_username", with: "usertest"
        fill_in "user_email", with: "user@example.com"
        fill_in "user_password", with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end
        it "should create a user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end
      end
end