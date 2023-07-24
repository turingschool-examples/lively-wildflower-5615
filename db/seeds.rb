# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

GuestRoom.delete_all
Guest.delete_all
Room.delete_all
Hotel.delete_all


hotel1 = Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain')
hotel2 = Hotel.create(name: 'Alpine Lodge', location: 'Snowy Peaks')


room1 = hotel1.rooms.create(rate: 125, suite: 'Presidential')
room2 = hotel1.rooms.create(rate: 100, suite: 'Deluxe')
room3 = hotel2.rooms.create(rate: 80, suite: 'Mountain View')
room4 = hotel2.rooms.create(rate: 60, suite: 'Standard')


guest1 = Guest.create(name: 'Charlize Theron', nights: 3)
guest2 = Guest.create(name: 'Leonardo DiCaprio', nights: 5)
guest3 = Guest.create(name: 'Natalie Portman', nights: 2)


GuestRoom.create(guest: guest1, room: room1)
GuestRoom.create(guest: guest1, room: room3)
GuestRoom.create(guest: guest2, room: room2)
GuestRoom.create(guest: guest3, room: room4)


