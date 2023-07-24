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

    describe "lists all the rooms they've stayed in" do
      it "lists the room's suite" do
        within("#rooms") do
          expect(page).to have_content(@room_4.suite)
          expect(page).to have_content(@room_1.suite)
          expect(page).to have_content(@room_7.suite)
        end
      end

      it "lists the room's nightly rate" do
        within("#rooms") do
          expect(page).to have_content(@room_4.rate)
          expect(page).to have_content(@room_1.rate)
          expect(page).to have_content(@room_7.rate)
        end
      end

      it "lists the room's name of the hotel that it belongs to" do
        within("#rooms") do
          expect(page).to have_content(@ritz.name)
          expect(page).to have_content(@plaza.name)
          expect(page).to have_content(@beverly.name)
        end
      end
    end

    describe "form to add a room to the guest" do
      it 'shows a form to add a room to the guest by room ID' do
        expect(page).to have_css("#add_room_form")
        expect(page).to have_button("Add Room to #{@guest_1.name}")
      end

      it 'redirects to guest page after submitting a room ID' do
        within("#add_room_form") do
          fill_in :room_id, with: 6
          click_button("Add Room to #{@guest_1.name}")
        end
        
        expect(current_path).to eq("/guests/#{@guest_1.id}")
      end

      it 'shows the new room now listed under the guests past stays' do
        expect(page).to_not have_content(@room_6.suite)

        within("#add_room_form") do
          fill_in :room_id, with: @room_6.id
          click_button("Add Room to #{@guest_1.name}")
        end

        expect(page).to have_content(@room_6.suite)
      end
    end
  end
end