require 'rails_helper'

RSpec.describe "guests show page" do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Hotel California", location: "California")

    @guest_1 = Guest.create!(name: "Jorge", nights: 2)

    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
    @room_2 = @hotel_1.rooms.create!(rate: 500, suite: "Presidential")

    GuestRoom.create!(guest: @guest_1, room: @room_1)
    GuestRoom.create!(guest: @guest_1, room: @room_2)
  end

  describe "as a visitor" do
    describe "when I visit a guest's show page" do
      it "I see the guest's name, I see a list of all the rooms they've stayed in including the room's suite, nightly rate, and the name of the hotel that it belongs to" do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content(@guest_1.name)
        expect(page).to have_content(@hotel_1.name)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_2.rate)
        expect(page).to have_content(@room_2.suite)
      end
    end
  end
end