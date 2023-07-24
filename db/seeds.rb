# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create hotels
hotel1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
hotel2 = Hotel.create!(name: 'Snowy Peaks Lodge', location: 'Snowy Peaks')

# Create rooms for hotels
room1 = Room.create!(rate: 125, suite: 'Presidential', hotel: hotel1)
room2 = Room.create!(rate: 95, suite: 'Standard', hotel: hotel1)
room3 = Room.create!(rate: 150, suite: 'Luxury', hotel: hotel2)
room4 = Room.create!(rate: 100, suite: 'Standard', hotel: hotel2)

# Create guests
guest1 = Guest.create!(name: 'Charlize Theron', nights: 3)
guest2 = Guest.create!(name: 'Keanu Reeves', nights: 2)
guest3 = Guest.create!(name: 'Bob Ross', nights: 1)

# Record the stays for these guests
Stay.create!(room: room1, guest: guest1)
Stay.create!(room: room2, guest: guest1)
Stay.create!(room: room3, guest: guest2)
