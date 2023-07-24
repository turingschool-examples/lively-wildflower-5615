require 'rails_helper'

RSpec.describe Guest, type: :feature do
#   As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.

  it "can see guest's name and a list of rooms they have stayed in" do
    hotel_1 = Hotel.create!(name: "Hilton", location: "Denver")
    room_1 = Room.create!(rate: 100, suite: "The Blue Room", hotel_id: hotel_1.id)
    room_2 = Room.create!(rate: 200, suite: "The Red Room", hotel_id: hotel_1.id)
    guest_1 = Guest.create(name: "Bob", nights: 3)
    guest_1.rooms << room_1
    guest_1.rooms << room_2
    guest_1.save
   

      visit "/guest/#{guest_1.id}"

      expect(page).to have_content(guest_1.name)
      expect(page).to have_content(room_1.suite)
      expect(page).to have_content(room_1.rate)
      expect(page).to have_content(hotel_1.name)
      expect(page).to have_content(room_2.suite)
      expect(page).to have_content(room_2.rate)
  end

#   Story 2
# Add a Guest to a Room

# As a visitor
# When I visit a guest's show page
# Then I see a form to add a room to this guest.
# When I fill in a field with the id of an existing room
# And I click submit
# Then I am redirected back to the guest's show page
# And I see the room now listed under this guest's rooms.
# (You do not have to test for a sad path, for example if the ID submitted is not an existing room)
# ```
  it "can add a room to a guest" do
    hotel_1 = Hotel.create!(name: "Hilton", location: "Denver")
    room_1 = Room.create!(rate: 100, suite: "The Blue Room", hotel_id: hotel_1.id)
    guest_1 = Guest.create(name: "Bob", nights: 3)

    visit "/guest/#{guest_1.id}"

    expect(page).to have_content(guest_1.name)
        
    fill_in :room_id, with: room_1.id
    click_button "Add Room"

    expect(current_path).to eq("/guest/#{guest_1.id}")
    expect(page).to have_content(guest_1.name)
    expect(page).to have_content(room_1.suite)
  end
end
