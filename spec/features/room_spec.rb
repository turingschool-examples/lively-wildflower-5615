require 'rails_helper'

RSpec.describe Room do

  #Story 3
  #Rooms Index
  #As a visitor
  #When I visit the rooms index page
  #Then I see a list of all rooms
  #including the room's suite, nightly rate, and the name of the hotel that it belongs to
  it "and the number of guests that have stayed in that room." do
    @hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
    @room_1 = Room.create!(rate: 100, suite: "Redrum", hotel: @hotel_1)
    @room_2 = Room.create!(rate: 200, suite: "Presedential", hotel: @hotel_1)
    @room_3 = Room.create!(rate: 300, suite: "Regular", hotel: @hotel_1)
    @guest_1 = Guest.create!(name: "Jack Torrance", nights: 2)
    @guest_2 = Guest.create!(name: "Dick Halloran", nights: 3)
    @guest_3 = Guest.create!(name: "Wendy Torrance", nights: 4)

    @guest_1.rooms << @room_1

    @guest_1.rooms << @room_2
    @guest_2.rooms << @room_2

    @guest_1.rooms << @room_3
    @guest_2.rooms << @room_3
    @guest_3.rooms << @room_3

    visit "/rooms"

    rooms = [@room_1, @room_2, @room_3]

    rooms.each do |room|
      expect(page).to have_content(room.suite)
      expect(page).to have_content(room.rate)
      expect(page).to have_content(room.hotel.name)
      expect(page).to have_content(room.guests.count)
    end
  end
end