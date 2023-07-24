require "rails_helper"

RSpec.describe "Guest show page" do
#   Story 1
# Guest Show

# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.

  before do
    @echo_mountain = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @stanley = Hotel.create!(name: "The Stanley Hotel", location: "Estes Park")

    @room_1 = @echo_mountain.rooms.create!(rate: 125, suite: "Presidential")
    @room_2 = @echo_mountain.rooms.create!(rate: 140, suite: "Honeymoon")
    @room_3 = @echo_mountain.rooms.create!(rate: 100, suite: "Standard")
    @room_4 = @stanley.rooms.create!(rate: 123, suite: "Junior")
    @room_5 = @stanley.rooms.create!(rate: 231, suite: "Penthouse")

    @charlize = Guest.create!(name: "Charlize Theron", nights: 3)

    GuestRoom.create!(guest: @charlize, room: @room_1)
    GuestRoom.create!(guest: @charlize, room: @room_2)
    GuestRoom.create!(guest: @charlize, room: @room_4)
    GuestRoom.create!(guest: @charlize, room: @room_5)
  end

  describe "header" do
    it "displays the guest's name" do
      visit "/guests/#{@charlize.id}"

      expect(page).to have_content("Guest: Charlize Theron")
    end
  end

  describe "list of rooms the guest has stayed in" do
    it "includes room's suite, nightly rate, and name of hotel" do
      visit "/guests/#{@charlize.id}"

      expect(page).to have_content("This guest has stayed in the following rooms:")
      expect(page).to_not have_content("Standard")
      expect(page).to_not have_content("100")

      within("#room-#{@room_1.id}") do
        expect(page).to have_content("Presidential Suite")
        expect(page).to have_content("Rate: 125 per night")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
      end

      within("#room-#{@room_2.id}") do
        expect(page).to have_content("Honeymoon Suite")
        expect(page).to have_content("Rate: 140 per night")
        expect(page).to have_content("Hotel: Echo Mountain Inn")
      end

      within("#room-#{@room_4.id}") do
        expect(page).to have_content("Junior Suite")
        expect(page).to have_content("Rate: 123 per night")
        expect(page).to have_content("Hotel: The Stanley Hotel")
      end

      within("#room-#{@room_5.id}") do
        expect(page).to have_content("Penthouse Suite")
        expect(page).to have_content("Rate: 231 per night")
        expect(page).to have_content("Hotel: The Stanley Hotel")
      end
    end
  end
end