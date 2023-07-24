require 'rails_helper'

RSpec.describe "Guests show page", type: :feature do 
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Tipton Hotel", location: "Boston, Massachusetts")
    @room_1 = @hotel_1.rooms.create!(rate: 300, suite: "standard")
    @guest_1 = @room_1.guests.create!(name: "Zack", nights: 4)
    GuestRoom.create!(room_id: @room_1.id, guest_id: @guest_1.id)
  end

#   Story 1
# Guest Show

# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.
  describe "as a visitor" do
    it "all guest info" do 
      visit "/guests/#{@guest_1.id}"

      expect(page).to have_content(@guest_1.name)

      within("#guest-room-#{@guest_room.id}") do 
        expect(page).to have_content(@guest_1.first.suite)
        expect(page).to have_content(@guest_1.first.rate)
        expect(page).to have_content(@guest_1.first.hotel.name)
      end
    end
  end
end