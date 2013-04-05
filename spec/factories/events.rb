# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Test Event"
    user
    description "Test Description"
  end
end
