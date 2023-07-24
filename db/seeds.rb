# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hotel = Hotel.create(name: 'Green Mountian Inn', location: 'Stowe')

room1 = hotel.rooms.create(rate: 200, suite: 'Super')
room2 = hotel.rooms.create(rate: 100, suite: 'Double')
room3 = hotel.rooms.create(rate: 50, suite: 'Standard')

guest1 = Guest.create(name: 'Kye', nights: 6)
guest2 = Guest.create(name: 'Martha', nights: 2)

GuestsRoom.create(guest: guest1, room: room1)
GuestsRoom.create(guest: guest1, room: room2)
GuestsRoom.create(guest: guest2, room: room3)