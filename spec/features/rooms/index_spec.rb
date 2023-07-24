require "rails_helper"

RSpec.describe "Rooms index page" do

  before do
    @echo_mountain = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @stanley = Hotel.create!(name: "The Stanley Hotel", location: "Estes Park")

    @room_1 = @echo_mountain.rooms.create!(rate: 125, suite: "Presidential")
    @room_2 = @echo_mountain.rooms.create!(rate: 140, suite: "Honeymoon")
    @room_3 = @echo_mountain.rooms.create!(rate: 100, suite: "Standard")
    @room_4 = @stanley.rooms.create!(rate: 123, suite: "Junior")
    @room_5 = @stanley.rooms.create!(rate: 231, suite: "Penthouse")

    @charlize = Guest.create!(name: "Charlize Theron", nights: 3)
    @david = Guest.create!(name: "David Tennant", nights: 4)
    @jim = Guest.create!(name: "Jim Carrey", nights: 1)

    GuestRoom.create!(guest: @charlize, room: @room_1)
    GuestRoom.create!(guest: @charlize, room: @room_2)
    GuestRoom.create!(guest: @charlize, room: @room_4)
    GuestRoom.create!(guest: @david, room: @room_1)
    GuestRoom.create!(guest: @david, room: @room_2)
    GuestRoom.create!(guest: @david, room: @room_4)
    GuestRoom.create!(guest: @jim, room: @room_1)
    GuestRoom.create!(guest: @jim, room: @room_5)
  end
#   Story 3
# Rooms Index

# As a visitor
# When I visit the rooms index page
# Then I see a list of all rooms
# including the room's suite, nightly rate, and the name of the hotel that it belongs to
# and the number of guests that have stayed in that room.

  it "is a list of all rooms and their details" do
    visit "/rooms"

    expect(page).to have_content("All Rooms")

    within("#room-#{@room_1.id}") do
      expect(page).to have_content("Presidential Suite")
      expect(page).to have_content("Rate: 125 per night")
      expect(page).to have_content("Hotel: Echo Mountain Inn")
      expect(page).to have_content("Guests that have stayed in this room: 3")
    end

    within("#room-#{@room_2.id}") do
      expect(page).to have_content("Honeymoon Suite")
      expect(page).to have_content("Rate: 140 per night")
      expect(page).to have_content("Hotel: Echo Mountain Inn")
      expect(page).to have_content("Guests that have stayed in this room: 2")
    end

    within("#room-#{@room_3.id}") do
      expect(page).to have_content("Standard Suite")
      expect(page).to have_content("Rate: 100 per night")
      expect(page).to have_content("Hotel: Echo Mountain Inn")
      expect(page).to have_content("Guests that have stayed in this room: 0")
    end

    within("#room-#{@room_4.id}") do
      expect(page).to have_content("Junior Suite")
      expect(page).to have_content("Rate: 123 per night")
      expect(page).to have_content("Hotel: The Stanley Hotel")
      expect(page).to have_content("Guests that have stayed in this room: 2")
    end

    within("#room-#{@room_5.id}") do
      expect(page).to have_content("Penthouse Suite")
      expect(page).to have_content("Rate: 231 per night")
      expect(page).to have_content("Hotel: The Stanley Hotel")
      expect(page).to have_content("Guests that have stayed in this room: 1")
    end
  end
end