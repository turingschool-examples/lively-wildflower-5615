require "rails_helper"

RSpec.describe "Guest show page" do
  let(:hotel) { Hotel.create(name: "Continental", location: "New York") }
  let(:guest) { Guest.create(name: "John Wick", nights: 3) }
  let(:room) { Room.create(hotel: hotel, suite: "President Suite", rate: 100) }
  let!(:room_guest) { RoomGuest.create(guest: guest, room: room) }

  it "should show guest name and list all of the rooms" do
    visit "/guests/#{guest.id}"

    expect(page).to have_content("John Wick")
    expect(page).to have_content("Rooms stayed in:")

    within("#rooms") do
      expect(page).to have_content("Suite: President Suite")
      expect(page).to have_content("Rate: 100")
      expect(page).to have_content("Hotel: Continental")
    end
  end

  it "should show a form to add a room to the guest" do
    another_room = Room.create(hotel: hotel, suite: "Deluxe Suite", rate: 150)

    visit "/guests/#{guest.id}"

    within("#add-room-form") do
      fill_in "Room ID", with: another_room.id
      click_button "Add Room"
    end

    expect(current_path).to eq "/guests/#{guest.id}"

    within("#rooms") do
      expect(page).to have_content("Suite: Deluxe Suite")
      expect(page).to have_content("Rate: 150")
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

# Story 2
# Add a Guest to a Room

# As a visitor
# When I visit a guest's show page
# Then I see a form to add a room to this guest.
# When I fill in a field with the id of an existing room
# And I click submit
# Then I am redirected back to the guest's show page
# And I see the room now listed under this guest's rooms.
# (You do not have to test for a sad path, for example if the ID submitted is not an existing room)