require "rails_helper"

RSpec.describe "Guest show page" do

  it "should show guest name and list all of the rooms" do

    hotel = Hotel.create!(name: "Continental", location: "New York")
    guest = Guest.create!(name: "John Wick", nights: 3)
    room = Room.create!(hotel: hotel, suite: "President Suite", rate: 100)
    
    RoomGuest.create!(guest: guest, room: room)

    visit "/guests/#{guest.id}"
    
    expect(page).to have_content("John Wick")
    expect(page).to have_content("Rooms stayed in:")

    within("#rooms") do
      expect(page).to have_content("Suite: President Suite")
      expect(page).to have_content("Rate: 100")
      expect(page).to have_content("Hotel: Continental")
    end
  end
end


# Story 1
# Guest Show

# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.