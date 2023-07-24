# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@guest_1 = Guest.create!(name: "Jake Ryan", nights: 3)
@hotel_1 = Hotel.create!(name: "Plaza", location: "Meridian Islands")
@room_1 = Room.create!(rate: 130, suite: "Standard", hotel: @hotel_1, guest_id: @guest_1.id)
@room_2 = Room.create!(rate: 500, suite: "Presidential", hotel: @hotel_1, guest_id: @guest_1.id)