require "rails_helper"

RSpec.describe "rooms index page" do

# Story 3
# Rooms Index
# As a visitor
# When I visit the rooms index page
# Then I see a list of all rooms
# including the room's suite, nightly rate, 
# and the name of the hotel that it belongs to
# and the number of guests that have stayed in that room.

  it "displays a list of all rooms" do
    hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen" )
    hotel_2 = Hotel.create!(name: "Burger MTN", location: "Durango" )
    room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    room_2 = hotel_1.rooms.create!(rate: 150, suite: "Honeymoon")
    room_3 = hotel_2.rooms.create!(rate: 175, suite: "Emperor")

    visit "/rooms"

    expect(page).to have_content("Presidential")
    expect(page).to have_content("Honeymoon")
    expect(page).to have_content("Emperor")
  end

  it "includes the room's suite, rate and hotel it belongs to" do
    hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen" )
    hotel_2 = Hotel.create!(name: "Burger MTN", location: "Durango" )
    room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    room_2 = hotel_1.rooms.create!(rate: 150, suite: "Honeymoon")
    room_3 = hotel_2.rooms.create!(rate: 175, suite: "Emperor")

    visit "/rooms"

    expect(page).to have_content("125")
    expect(page).to have_content("150")
    expect(page).to have_content("175")
    expect(page).to have_content("Aspen Inn")
    expect(page).to have_content("Burger MTN")
  end

  it "displays the number of guests that have stayed in the corresponding room" do
    hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen" )
    hotel_2 = Hotel.create!(name: "Burger MTN", location: "Durango" )
    room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    room_2 = hotel_1.rooms.create!(rate: 150, suite: "Honeymoon")
    room_3 = hotel_2.rooms.create!(rate: 175, suite: "Emperor")

    guest_1 = Guest.create!(name: "Charlie Day", nights: 3)
    guest_2 = Guest.create!(name: "Tom Hardy", nights: 5)
    guest_3 = Guest.create!(name: "Jake Johnson", nights: 10)

    room_1.guests << guest_1
    room_2.guests << guest_1
    room_2.guests << guest_2
    room_3.guests << guest_1
    room_3.guests << guest_2
    room_3.guests << guest_3

    visit "/rooms"

    save_and_open_page

    expect(page).to have_content("Guest Count: 1")
    expect(page).to have_content("Guest Count: 2")
    expect(page).to have_content("Guest Count: 3")
  end
end