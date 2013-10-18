FactoryGirl.define do

  factory :user do
    first_name     "Alessandro"
    last_name     "Dimich"
    username  "zzpilottest"
    email    "a.dimich@example.com"
    password "foobar"
    password_confirmation "foobar"

    # Funzionalità admin da implementare
    # factory :admin do
    #   admin true
    # end

  end

end