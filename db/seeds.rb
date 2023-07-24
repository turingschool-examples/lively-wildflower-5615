# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RoomGuest.destroy_all
Guest.destroy_all
Room.destroy_all
Hotel.destroy_all

hotel1 = Hotel.create!(name:"Vail Inn", location:"Vail")
hotel2 = Hotel.create!(name:"Lionshead Chalet", location:"Lionshead")

room1 = hotel1.rooms.create!(rate: 125, suite: "Presidential")
room2 = hotel1.rooms.create!(rate: 130, suite: "Executive")
room3 = hotel1.rooms.create!(rate: 100, suite: "Basic")
room4 = hotel2.rooms.create!(rate: 200, suite: "Pineapple")
room5 = hotel2.rooms.create!(rate: 75, suite: "Below Average")

guest1 = Guest.create!(name: "Ethan", nights: 3)
guest2 = Guest.create!(name: "Zahava", nights: 3)
guest3 = Guest.create!(name: "Ezzy", nights: 1)
guest4 = Guest.create!(name: "Jonathan", nights: 1)
guest5 = Guest.create!(name: "Greg", nights: 1)
guest6 = Guest.create!(name: "Elana", nights: 1)

room1.guests << guest1
room1.guests << guest2
room1.guests << guest3

room2.guests << guest1
room2.guests << guest3
room2.guests << guest4
room2.guests << guest5

room3.guests << guest1
room3.guests << guest6

room4.guests << guest1
room4.guests << guest2

room5.guests << guest2
room5.guests << guest4
