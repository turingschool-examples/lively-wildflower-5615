require 'rails_helper'

RSpec.describe 'Guests show page', type: :feature do
  describe "When I visit a guest's show page" do
    before :each do
      @plaza = Hotel.create!(name: "The Plaza", location: "New York")
      @ritz = Hotel.create!(name: "Hotel Ritz", location: "Paris")
      @beverly = Hotel.create!(name: "Beverly Hills Hotel", location: "California")
      
      @room_1 = @plaza.rooms.create!(rate: 600, suite: "Presidential")
      @room_2 = @plaza.rooms.create!(rate: 400, suite: "Honeymoon")
      @room_3 = @ritz.rooms.create!(rate: 550, suite: "Presidential")
      @room_4 = @ritz.rooms.create!(rate: 700, suite: "Royal")
      @room_5 = @ritz.rooms.create!(rate: 850, suite: "Eiffiel Tower View")
      @room_6 = @beverly.rooms.create!(rate: 500, suite: "Madonna Suite")
      @room_7 = @beverly.rooms.create!(rate: 750, suite: "Judy Garland Suite")

      @guest_1 = Guest.create!(name: "Manila Luzon", nights: 3)
      @guest_2 = Guest.create!(name: "Latrice Royal", nights: 2)
      @guest_3 = Guest.create!(name: "Monet Exchange", nights: 5)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_4.id)
      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_7.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_3.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_6.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_5.id)

      visit "/guests/#{@guest_1.id}"
    end

    it 'shows the guests name' do
      expect(page).to have_content(@guest_1.name)
      expect(page).to_not have_content(@guest_2.name)
    end

    context "lists all the rooms they've stayed in" do
      it "lists the previous room's suite" do
        within("#past_stays") do
          expect(page).to have_content(@room_4.suite)
          expect(page).to have_content(@room_1.suite)
          expect(page).to have_content(@room_7.suite)
        end
      end

      it "lists the previous room's nightly rate" do
        within("#past_stays") do
          expect(page).to have_content(@room_4.rate)
          expect(page).to have_content(@room_1.rate)
          expect(page).to have_content(@room_7.rate)
        end
      end

      it "lists the previous room's name of the hotel that it belongs to" do
        within("#past_stays") do
          expect(page).to have_content(@ritz.name)
          expect(page).to have_content(@plaza.name)
          expect(page).to have_content(@beverly.name)
        end
        save_and_open_page
      end
    end
  end
end