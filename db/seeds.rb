
3.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    address: Faker::Address.street_address + Faker::Address.street_name,
    phone_number: Faker::PhoneNumber.phone_number,
    password: "password"
    )
end

# User.create(username: 's', email: 's@s', address: 'S St.', phone_number: '2027310710', password: 's')


# User.create(username: 'j', email: 'j@j', address: 'j jt.', phone_number: '2027310710', password: 'j')

Game.create(name: 'Settlers of Catan', description: "Strategic economy based board game that challenges players to think dynamically about trading and resources", minplayers:2, maxplayers: 4, minage: 13, host: User.first)

Game.create(name: 'Dominion', description: "Strategic card drafting board game that challenges players to think on the fly about the best possible strategy", minplayers:2, maxplayers: 4, minage: 13, host: User.first)

Game.create(name: 'Ticket to Ride', description: "Players compete to complete the best tracks across the country", minplayers:2, maxplayers: 4, minage: 6, host: User.last)
