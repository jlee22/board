
require 'faker'

10.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address + Faker::Address.street_name,
    password: "password"
    )
end
