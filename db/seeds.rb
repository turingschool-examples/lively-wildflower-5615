# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @hotel_1 = Hotel.create!(name: "Hotel California", location: "California")
# @hotel_2 = Hotel.create!(name: "Hotel Colorado", location: "Colorado")

# @guest_1 = Guest.create!(name: "Jorge", nights: 2)
# @guest_2 = Guest.create!(name: "Nancy", nights: 3)

# @room_1 = Room.create!(rate: 125, suite: "Economy")
# @room_2 = Room.create!(rate: 500, suite: "Presidential")
# @room_3 = Room.create!(rate: 250, suite: "Loft")



@hotel_1 = Hotel.create!(name: "Hotel California", location: "California")

@guest_1 = Guest.create!(name: "Jorge", nights: 2)
@guest_2 = Guest.create!(name: "Nancy", nights: 3)

@room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
@room_2 = @hotel_1.rooms.create!(rate: 500, suite: "Presidential")
