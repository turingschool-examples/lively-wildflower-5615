require "rails_helper"

RSpec.describe "Guest Show", type: :feature do
  before (:each) do
    @hotel_1 = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @room_1 = Room.create!(rate: 125, suite: "Presidential", hotel: @hotel_1)
    @guest_1 = Guest.create!(name: "Charlize Theron", nights: 3)
    @guest_1_room_1 = GuestRoom.create!(guest_id: @guest_1, room_id: @room_1)
  end

  describe "As a visitor" do
    describe "When I visit a guest's show page" do
      it "I see the guest's name" do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content(@guest_1.name)
      end

      it "And I see a list of all the rooms they've stayed in including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
        visit "/guests/#{guest_1.id}"

        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@room_1.hotel.name)
      end
    end
  end
end
