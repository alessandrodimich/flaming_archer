require 'spec_helper'

describe "authentication" do
subject { page }
describe "sessions/new.html.erb" do
  it { should have_selector('h2', 'Sign in') }
  it { should have_selector('title', text: 'Login') }
   it { should have_text("Email") }

end
end