require 'rails_helper'

RSpec.describe 'Rooms #index page', type: :feature do
  describe 'When I visit the rooms index page' do
    before :each do
      @plaza = Hotel.create!(name: "The Plaza", location: "New York")
      @ritz = Hotel.create!(name: "Hotel Ritz", location: "Paris")
      @beverly = Hotel.create!(name: "Beverly Hills Hotel", location: "California")
      
      @room_1 = @plaza.rooms.create!(rate: 600, suite: "Presidential")
      @room_2 = @ritz.rooms.create!(rate: 850, suite: "Eiffiel Tower View")
      @room_3 = @beverly.rooms.create!(rate: 500, suite: "Madonna Suite")
      @room_4 = @beverly.rooms.create!(rate: 750, suite: "Judy Garland Suite")

      @guest_1 = Guest.create!(name: "Manila Luzon", nights: 3)
      @guest_2 = Guest.create!(name: "Latrice Royal", nights: 2)
      @guest_3 = Guest.create!(name: "Monet Exchange", nights: 5)
      @guest_4 = Guest.create!(name: "Kasha Davis", nights: 7)
      @guest_5 = Guest.create!(name: "Milk", nights: 4)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_1.id)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)

      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_3.id)
      GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_3.id)

      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_4.id)
      GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_4.id)

      visit "/rooms"
    end

    describe "I see a list of all rooms" do
      it "lists the room's suite" do
        within("#room-#{@room_1.id}") do
          expect(page).to have_content(@room_1.suite)
        end

        within("#room-#{@room_2.id}") do
          expect(page).to have_content(@room_2.suite)
        end

        expect(page).to have_content(@room_3.suite)
        expect(page).to have_content(@room_4.suite)
      end

      it "lists the room's nightly rate" do
        within("#room-#{@room_1.id}") do
          expect(page).to have_content("Nightly Rate: $#{@room_1.rate}")
        end

        within("#room-#{@room_2.id}") do
          expect(page).to have_content("Nightly Rate: $#{@room_2.rate}")
        end

        expect(page).to have_content("Nightly Rate: $#{@room_3.rate}")
        expect(page).to have_content("Nightly Rate: $#{@room_4.rate}")
      end

      it "lists the room's name of the hotel that it belongs to" do
        within("#room-#{@room_1.id}") do
          expect(page).to have_content("Room at: #{@room_1.hotel.name}")
        end

        within("#room-#{@room_2.id}") do
          expect(page).to have_content("Room at: #{@room_2.hotel.name}")
        end

        expect(page).to have_content("Room at: #{@room_3.hotel.name}")
        expect(page).to have_content("Room at: #{@room_4.hotel.name}")
      end

      it "lists the number of guests that have stayed in that room" do
        within("#room-#{@room_1.id}") do
          expect(page).to have_content("Number of Previous Guests: #{@room_1.prev_guest_count}")
        end

        within("#room-#{@room_2.id}") do
          expect(page).to have_content("Number of Previous Guests: #{@room_2.prev_guest_count}")
        end

        expect(page).to have_content("Number of Previous Guests: #{@room_3.prev_guest_count}")
        expect(page).to have_content("Number of Previous Guests: #{@room_4.prev_guest_count}")
      end
    end
  end
end