require 'spec_helper'

describe "Home Page" do

  subject { page }

  before { visit root_path }

  it "should have the content 'home#welcome" do
      should have_selector('h1', text: 'Home#welcome' )
  end

  it { should have_selector('title', text: BASE_TITLE)}

  it "should not have a custom page title" do
      should_not have_selector('title', :text => '| Home')
  end
end

describe "Index" do

  subject { page }

  before { visit '/index' }

  it { should have_selector('title', text: full_title("index"))}
  it { should have_selector('h1', 'Home#index' ) }

end
