require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      puts "-----------------#{users_path}----------"
      #get users_path
      #response.status.should be(200)
      page.should have_selector('h1', text: 'Listing Users' )
    end
  end
end
