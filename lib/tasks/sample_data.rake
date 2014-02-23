namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Customer.create!(name: "Example Customer",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Customer.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
