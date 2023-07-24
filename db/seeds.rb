# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hotel_1 = Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain')
@hotel_2 = Hotel.create(name: 'Dead Inn', location: 'Lonely Road')

@room_1 = @hotel_1.rooms.create(rate: 125, suite: "Presidential")
@room_2 = @hotel_1.rooms.create(rate: 50, suite: "Budget")
@room_3 = @hotel_2.rooms.create(rate: 125, suite: "Presidential")
@room_4 = @hotel_2.rooms.create(rate: 75, suite: "Standard")

@guest_1 = Guest.create(name: 'Charlize Theron', nights: 3)
@guest_2 = Guest.create(name: 'Billy', nights: 1)
@guest_3 = Guest.create(name: 'Timbo', nights: 3)
@guest_4 = Guest.create(name: 'Jim', nights: 5)
@guest_5 = Guest.create(name: 'Mary', nights: 4)
@guest_6 = Guest.create(name: 'Tammy', nights: 4)

GuestRoom.create(room_id: @room_1.id, guest_id: @guest_1.id)
GuestRoom.create(room_id: @room_1.id, guest_id: @guest_2.id)
GuestRoom.create(room_id: @room_1.id, guest_id: @guest_3.id)
GuestRoom.create(room_id: @room_2.id, guest_id: @guest_2.id)
GuestRoom.create(room_id: @room_2.id, guest_id: @guest_4.id)
GuestRoom.create(room_id: @room_3.id, guest_id: @guest_2.id)