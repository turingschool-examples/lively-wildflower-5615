require "rails_helper"

RSpec.describe "/guests/:id", type: :feature do
  before do
    @hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @hotel_2 = Hotel.create!(name: 'Hot Springs Inn', location: 'Hot Springs')
    @hotel_3 = Hotel.create!(name: 'Cherokee Inn', location: 'Cherokee')
    @room_1 = @hotel_1.rooms.create!(rate: 250, suite: "Presidential")
    @room_2 = @hotel_1.rooms.create!(rate: 100, suite: "Standard")
    @room_3 = @hotel_3.rooms.create!(rate: 30, suite: "Closet")
    @guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    @guest_2 = Guest.create!(name: 'James Blake', nights: 4)
    @guest_3 = Guest.create!(name: 'Dan Smith', nights: 2)
    GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)
    GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)
    GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
  end

  describe "As a user" do
    context "When I visit a guest's show page" do
      it "I see the guest's name" do
        visit "/guests/#{@guest_1.id}"

        expect(page).to have_content(@guest_1.name)
        expect(page).to_not have_content(@guest_3.name)
      end

      it "I see a list of all the rooms they've stayed in including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
        visit "/guests/#{@guest_1.id}"
        save_and_open_page
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@hotel_1.name)
        expect(page).to_not have_content(@room_3.suite)
        expect(page).to_not have_content(@room_3.rate)
        expect(page).to_not have_content(@hotel_3.name)
      end
    end
  end
end