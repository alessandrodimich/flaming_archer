require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    before { visit users_path }
    it "Page should have content listing users" do
      page.should have_selector('h1', text: 'Listing users' )
    end
  end
end
