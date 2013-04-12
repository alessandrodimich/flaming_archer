namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "alessandro",
                 last_name: "dimich",
                 username: "dimich",
                 email: "alessandro.dimich@hotmail.com",
                 password: "qazxsw",
                 password_confirmation: "qazxsw")

    User.create!(first_name: "admin",
                 last_name: "admin",
                 username: "admin",
                 email: "dimichrails@gmail.com",
                 password: "qazxsw",
                 password_confirmation: "qazxsw")
    40.times do |n|
      username  = "esempio-#{n+1}"
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      email = "esempio-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(username: username, email: email, first_name: first_name, last_name: last_name, password: password, password_confirmation: password)
    end
  end
end