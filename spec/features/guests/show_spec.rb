require 'rails_helper'

RSpec.describe 'guests', type: :feature do

  describe 'GET #show' do

    before(:each) do
      @hotel = Hotel.create(name: 'Green Mountian Inn', location: 'Stowe')
      @room1 = @hotel.rooms.create(rate: 200, suite: 'Super')
      @room2 = @hotel.rooms.create(rate: 150, suite: 'Deluxe')
      @guest1 = Guest.create(name: 'Kye', nights: 6)
      @guests_room = GuestsRoom.create(guest: @guest1, room: @room1)
    end

    it "shows guests with information on show page" do
      visit "/guests/#{@guest1.id}"

      expect(page).to have_content(@guest1.name)
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Suite: #{@room1.suite}")
      expect(page).to have_content("Nightly Rate: $#{@room1.rate}")
    end

    it "can add rooms to guest" do
      visit "/guests/#{@guest1.id}"

      fill_in "Room ID:", with: @room2.id
      click_button "Add Room"

      expect(page).to have_content(@room2.hotel.name)
      expect(page).to have_content(@room2.suite)
      expect(page).to have_content("$#{@room2.rate}")
    end
  end
end
