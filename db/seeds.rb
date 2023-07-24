# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GuestRoom.destroy_all
Guest.destroy_all
Room.destroy_all
Hotel.destroy_all

@plaza = Hotel.create!(name: "The Plaza", location: "New York")
      @ritz = Hotel.create!(name: "Hotel Ritz", location: "Paris")
      @beverly = Hotel.create!(name: "Beverly Hills Hotel", location: "California")
      
      @room_1 = @plaza.rooms.create!(rate: 600, suite: "Presidential")
      @room_2 = @plaza.rooms.create!(rate: 400, suite: "Honeymoon")
      @room_3 = @ritz.rooms.create!(rate: 550, suite: "Presidential")
      @room_4 = @ritz.rooms.create!(rate: 700, suite: "Royal")
      @room_5 = @ritz.rooms.create!(rate: 850, suite: "Eiffiel Tower View")
      @room_6 = @beverly.rooms.create!(rate: 500, suite: "Madonna Suite")
      @room_7 = @beverly.rooms.create!(rate: 750, suite: "Judy Garland Suite")

      @guest_1 = Guest.create!(name: "Manila Luzon", nights: 3)
      @guest_2 = Guest.create!(name: "Latrice Royal", nights: 2)
      @guest_3 = Guest.create!(name: "Monet Exchange", nights: 5)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_4.id)
      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_7.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_3.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_6.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_5.id)