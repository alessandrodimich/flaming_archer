require 'spec_helper'

describe Event do

  it "should belong to a user" do
    event = FactoryGirl.build(:event, user: nil)
    event.valid?.should be_false
    event.errors[:user].should include("can't be blank")
    event.user = FactoryGirl.build(:user)
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
  end

end


