require 'spec_helper'

describe User do
  it "is valid with a firstname and lastname"
  it "is invalid without a firstname"
  it "is invalid without a lastname"
  it "is invalid with a duplicate email address"
  it "returns a contact's full name as a string"
end
