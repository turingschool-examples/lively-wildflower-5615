# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


emma = Hotel.create!(name: "Hotel Emma", location: "San Antonio")
wolf = Hotel.create!(name: "Great Wolf Lodge", location: "Dallas")

room_1 = emma.rooms.create!(rate: 500, suite: "Presidential")
room_2 = emma.rooms.create!(rate: 650, suite: "Penthouse")
room_3 = wolf.rooms.create!(rate: 300, suite: "Garden")
room_4 = wolf.rooms.create!(rate: 400, suite: "Animal Kingdom")

sara = Guest.create!(name: "Sara", nights: 2)
leo = Guest.create!(name: "Leo", nights: 3)
piper = Guest.create!(name: "Piper", nights: 3)
paige = Guest.create!(name: "Paige", nights: 1)