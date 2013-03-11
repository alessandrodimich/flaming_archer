
require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "login page" do
    before { visit login_path }
  end

  it { should have_selector('h2', text: 'Sign in') }
  it { should have_selector('title', text: 'Login') }

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