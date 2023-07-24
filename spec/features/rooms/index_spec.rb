require 'rails_helper'

RSpec.describe "rooms index page" do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Hotel California", location: "California")

    @guest_1 = Guest.create!(name: "Jorge", nights: 2)
    @guest_2 = Guest.create!(name: "Nancy", nights: 3)

    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
    @room_2 = @hotel_1.rooms.create!(rate: 500, suite: "Presidential")
    
    GuestRoom.create!(guest: @guest_1, room: @room_1)
    GuestRoom.create!(guest: @guest_2, room: @room_1)
  end

  describe "as a visitor" do
    describe "when I visit the rooms index page" do
      it "I see a list of all rooms including the room's suite, nightly rate, and the name of the hotel that it belongs to and the number of guests that have stayed in that room" do
        visit "/rooms"

        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@hotel_1.name)
        expect(page).to have_content("Number of Guests: 2")
      end
    end
  end
end