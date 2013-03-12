
require 'spec_helper'

describe "Authentication" do

  let (:user) { FactoryGirl.create(:user) }



 it "should have content Signin" do
   visit login_path
   page.should have_content('Sign in')
 end
  it "should have a title" do
    visit login_path
    page.should have_content('Remember')
  end

  it "should redirect to the welcome user page when valid parameters are typed" do

    visit login_path

    fill_in "user_password", with: user.password
    fill_in "user_email", :with => user.email

    click_button "Login"
    current_path == user_path(user)
    page.should have_content('logged in!')
    page.should have_selector('title', text: "#{user.username}")
  end

  it "should not redirect to the welcome user page when invalid parameters are typed" do

    visit login_path

    fill_in "user_password", with: "asdad"
    fill_in "user_email", :with => "sdfsdf"

    click_button "Login"
    current_path == login_path
    page.should_not have_content('logged in!')
    page.should have_selector('title', text: 'Login')
    page.should have_content('Invalid')
    page.should have_selector('div.alert.alert-error', text: 'Invalid')
  end


end









# ##############################################
#   describe "Login authentication" do

#     subject { page }
#     before { visit login_path }

#     it { should have_selector( 'h2', 'Sign in')}
#     it { should have_selector( 'title', 'Login')}

#     describe "logging in with valid information" do

#       let(:user) { FactoryGirl.create(:user) }

#       before do
#         fill_in "Email",    with: user.email
#         fill_in "Password", with: user.password
#         click_button "Login"
#       end

#       it { should have_selector('title', text user.username) }
#       it { should have_link('Back', users_path) }
#       it { should have_link'Edit', edit_user_path(user) }
#       it { should_not have_selector('title', 'Login') }

#   end

#     describe "logging in with invalid information" do

#       before do
#         click_button "Login"
#       end


#       it { should have_selector('title', text: 'Login') }
#       it { should have_selector('flash_alert', text: 'Invalid email or password') }
#    #    let(:user) { FactoryGirl.create(:user) }

#    #    before do
#    #      fill_in "Email",    with: user.email
#    #      fill_in "Password", with: "wrong_password"
#    #      click_button "Login"
#    #      puts "----------#{user.password}------#{user.email}--"
#    #    end

#    #    it { should have_selector('flash-alert', "Invalid email or password") }
#    #    it { should have_link('Back', users_path) }
#    #    it { should have_link'Edit', edit_user_path(user) }

#     end
# end