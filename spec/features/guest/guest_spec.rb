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
end
