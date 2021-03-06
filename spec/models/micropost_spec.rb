require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }

  before { @micropost = user.microposts.build(content: "this is a micropost test comment") }

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "it should not be valid if user id is not present" do
    before { @micropost.user_id = nil }
    it {should_not be_valid}
  end


  describe "it should not be valid if user content is not present" do
    before { @micropost.content = nil }
    it {should_not be_valid}
  end



  #This test verifies that calling Micropost.new with a nonempty user_id raises a mass assignment security error exception.
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Micropost.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end


  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 501 }
    it { should_not be_valid }
  end

end  #End of describe
