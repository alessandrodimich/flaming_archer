FactoryGirl.define do

    factory :event do
    name "Test Event"
    user  # Here we tell FG about the micropost associated user just by including a user in the definition of the factory
    description "Test Description"
    title "Title of the Event"

  end

end