require 'spec_helper'

describe "Home Page" do

  subject { page }

  before { visit root_path }

  it "should have the content 'home#welcome" do
      should have_selector('h1', text: 'Home#welcome' )
      should have_selector('title', BASE_TITLE)
  end

  it { should have_selector('title', BASE_TITLE)}

  it "should not have a custom page title" do
      should_not have_selector('title', :text => '| Home')
  end
end

describe "Index" do
puts "-------------"
puts puts full_title('index')
  subject { page }

  before { visit '/index' }

  it { should have_selector('title', full_title("Index"))}
  it { should have_selector('h1', 'Home#index' ) }

end
