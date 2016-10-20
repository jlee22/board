
# 10.times do
#   User.create(
#     username: Faker::Internet.user_name,
#     email: Faker::Internet.email,
#     address: Faker::Address.street_address + Faker::Address.street_name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     password: "password"
#     )
# end

User.create(username: 's', email: 's@s', address: 'S St.', phone_number: '2027310710', password: 's')


User.create(username: 'j', email: 'j@j', address: 'j jt.', phone_number: '2027310710', password: 'j')

Game.create(name: 'Catan', host: User.first)
