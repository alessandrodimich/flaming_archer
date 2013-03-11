require 'spec_helper'

describe "home/index.html.erb" do

    it { should have_selector('title', text: "index" )}
  it { should have_content('Home#index' ) }
end
