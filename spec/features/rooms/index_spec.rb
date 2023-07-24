require "rails_helper"

RSpec.describe "Rooms Index", type: :feature do
  before (:each) do
    @hotel_1 = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @room_1 = Room.create!(rate: 125, suite: "Presidential", hotel: @hotel_1)
    @guest_1 = Guest.create!(name: "Charlize Theron", nights: 3)
    @guest_1_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
  end
  describe "As a visitor" do
    describe "When I visit the rooms index page" do
      it "Then I see a list of all rooms including the room's suite, nightly rate, and the name of the hotel that it belongs to and the number of guests that have stayed in that room." do
        visit "/rooms"

        expect(page).to have_content("#{@room_1.suite}")
        expect(page).to have_content("#{@room_1.rate}")
        expect(page).to have_content("#{@room_1.hotel.name}")
        expect(page).to have_content("#{@guest_1.name}")
        
      end
    end
  end
end