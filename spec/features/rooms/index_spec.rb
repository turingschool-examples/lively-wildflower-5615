require "rails_helper"

RSpec.describe "rooms" do
  before :each do
    @hotel_1 = Hotel.create!(
      name: "Hilton",
      location: "SLC, UT")
    @hotel_2 = Hotel.create!(
      name: "Hyatt",
      location: "Denver, CO")

    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
    @room_2 = @hotel_1.rooms.create!(rate: 175, suite: "Deluxe")
    @room_3 = @hotel_2.rooms.create!(rate: 90, suite: "Single")
    @room_4 = @hotel_2.rooms.create!(rate: 135, suite: "Master")
    
    @guest_1 = Guest.create!(name: "Phillip", nights: 3)
    @guest_2 = Guest.create!(name: "Phillipa", nights: 7)
    @guest_3 = Guest.create!(name: "Jamie", nights: 10)
    @guest_4 = Guest.create!(name: "Jamison", nights: 14)

    @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    @guest_room_2 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)
    @guest_room_3 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_3.id)
    @guest_room_4 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
    @guest_room_5 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_1.id)
  end

  describe "index page" do
    it "shows list of all rooms, including room's suite, nightly rate, hotel it belongs to, and number of guests that have stayed there" do
      visit "/rooms"
      
      within "#Rooms" do
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_2.suite)
        expect(page).to have_content(@room_3.suite)
        expect(page).to have_content(@room_4.suite)
      end

      within "#Economy" do
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@room_1.hotel.name)
        expect(page).to have_content(@room_1.guest_count)
      end

      within "#Deluxe" do
        expect(page).to have_content(@room_2.suite)
        expect(page).to have_content(@room_2.rate)
        expect(page).to have_content(@room_2.hotel.name)
        expect(page).to have_content(@room_2.guest_count)
      end

      within "#Single" do
        expect(page).to have_content(@room_3.suite)
        expect(page).to have_content(@room_3.rate)
        expect(page).to have_content(@room_3.hotel.name)
        expect(page).to have_content(@room_3.guest_count)
      end

      within "#Master" do
        expect(page).to have_content(@room_4.suite)
        expect(page).to have_content(@room_4.rate)
        expect(page).to have_content(@room_4.hotel.name)
        expect(page).to have_content(@room_4.guest_count)
      end
    end
  end
end
