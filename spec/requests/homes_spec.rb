require 'spec_helper'

describe "Homes" do
  describe "GET /homes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/index'
      response.status.should be(200)
    end
    it "should have the content 'home#welcome" do

      page.should have_content('home#welcome')
    end
  end
end
