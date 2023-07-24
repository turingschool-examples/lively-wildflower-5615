require 'rails_helper'

RSpec.describe Room, type: :feature do
  #   As a visitor
  # When I visit the rooms index page
  # Then I see a list of all rooms
  # including the room's suite, nightly rate, and the name of the hotel that it belongs to
  # and the number of guests that have stayed in that room.
  it "can see a list of all rooms" do
    hotel_1 = Hotel.create!(name: "Hilton", location: "Denver")
    room_1 = Room.create!(rate: 100, suite: "The Blue Room", hotel_id: hotel_1.id)
    room_2 = Room.create!(rate: 200, suite: "The Red Room", hotel_id: hotel_1.id)
    guest_1 = Guest.create(name: "Bob", nights: 3)
    guest_2 = Guest.create(name: "Sally", nights: 2)
    guest_1.rooms << room_1
    guest_1.rooms << room_2
    guest_2.rooms << room_1

    visit "/rooms"

    expect(page).to have_content(room_1.suite)
    expect(page).to have_content(room_1.rate)
    expect(page).to have_content(hotel_1.name)
    expect(page).to have_content(room_2.suite)
    expect(page).to have_content(room_2.rate)
    expect(page).to have_content(room_1.guests.count)
    expect(page).to have_content(room_2.guests.count)
  end
end
