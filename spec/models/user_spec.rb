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
  it { should be_valid }
  it "is valid with a firstname and lastname"
  it "is invalid without a firstname?"
  it "is invalid without a lastname?"
  it "is invalid with a duplicate email address"
  it "returns a contact's full name as a string"
  it "first_name can only contain letters, spaces or dots" #Verify on the dots
  it "last_name can only contain letters, spaces or dots" #Verify on the dots
  it "username can only contain letters, numbers, dashes, underscores or dots"

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
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "Verify Username Uniqueness, even in capital letters" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.username.upcase!
      user_with_same_username.save
    end
    it { should_not be_valid }
  end



end
