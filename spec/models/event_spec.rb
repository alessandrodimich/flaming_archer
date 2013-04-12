require 'spec_helper'

describe Event do

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:title) }
  it { should respond_to(:user) }


  it "should belong to a user" do
    event = FactoryGirl.build(:event, user: nil)
    event.valid?.should be_false
    event.errors[:user_id].nil?.should be_false
    event.should_not be_valid
    event.user = FactoryGirl.create(:user)
    event.valid?.should be_true
  end

  it "should require  name" do
    event = FactoryGirl.build(:event, name: nil)
    event.valid?.should be_false
    event.errors[:name].should include("can't be blank")
    event.name = "Event name"
    event.valid?.should be_true
  end

  it "should require a description" do
    event = FactoryGirl.build(:event, description: nil)
    event.valid?.should be_false
    event.errors[:description].should include("can't be blank")
    event.description = "description text"
    event.valid?.should be_true
    event.should respond_to :user_id
  end

  it "should not allow access to user_id" do
    user = FactoryGirl.create(:user)
    expect do
      Event.new(user_id = user.id)
    end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end

end


