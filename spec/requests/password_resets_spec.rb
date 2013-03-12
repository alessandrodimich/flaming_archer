require 'spec_helper'

describe "PasswordResets" do

  let (:user) { FactoryGirl.create(:user) }

  it "emails user when requesting password reset" do

    visit login_path
    click_link "password?"
    fill_in "Email", :with => user.email
    click_button "Reset Password"
    current_path.should eq(root_path)
    page.should have_content("an email has been sent to the address")
    last_email.to.should include(user.email)
  end
end
