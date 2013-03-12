# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  username               :string(255)      not null
#  password_digest        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  remember_me_token      :string(255)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#

require 'spec_helper'

describe User do

  before { @user = User.new(first_name: "Example", last_name: "User", username: "test_user", email: "user@example.com", password: "password", password_confirmation: "password") }
  subject { @user }
  it { should respond_to(:username) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:gender) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }
  it "is valid with a firstname and lastname"
  it "is invalid without a firstname?"
  it "is invalid without a lastname?"
  it "is invalid with a duplicate email address"
  it "returns a contact's full name as a string"
  it "first_name can only contain letters, spaces or dots" #Verify on the dots
  it "last_name can only contain letters, spaces or dots" #Verify on the dots
  it "username can only contain letters, numbers, dashes, underscores or dots"
  it " is invalid when password confirmation is nil" #VERIFICARE PERCHE SI DEVE RIMUOVERE LA PASSWORD CONFIRMATION

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        puts @user.email
        @user.should_not be_valid
      end
    end
  end

  describe "Verify Email Uniqueness" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email.upcase!  #Verify also ignore case scenario
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "Verify Username Uniqueness, also in capital letters" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.username.upcase!
      user_with_same_username.save
    end
    it { should_not be_valid }
  end

  describe "verify first_name capitalization" do
    subject { @user.first_name }
    before do
      @user.first_name = "test"
      @user.save
    end
    it { should == "Test"}
  end

  describe "verify last_name capitalization" do
    subject { @user.last_name }
    before do
      @user.last_name = "user"
      @user.save
    end
    it { should == "User"}
  end

  describe "verify username to lower case" do
    subject { @user.username }
    before do
      @user.username = "USER-_name51"
      @user.save
    end
    it { should == "user-_name51"}
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
  end

  describe "when password confirmation is empty" do  #Check how to test with the password required method
    before do
      @user.password_confirmation = ""
    end
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not == user_for_invalid_password }
    specify { user_for_invalid_password.should be_false }
    end
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end


 describe "#send_password_reset" do
    let(:user) { FactoryGirl.create(:user) }

    it "generates a unique password_reset_token each time" do
      user.send_password_reset(user)
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end
end
