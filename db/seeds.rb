# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen" )
  hotel_2 = Hotel.create!(name: "Breck Lodge", location: "Breckenridge" )

  room_1 = Room.create!(rate: 125, suite: "Presidential")
  room_2 = Room.create!(rate: 150, suite: "Honeymoon")

  guest_1 = Guest.create!(name: "Charlie Day", nights: 3)
  guest_2 = Guest.create!(name: "Tom Hardy", nights: 5)