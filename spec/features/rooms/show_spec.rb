require 'rails_helper'

RSpec.describe Room, type: :feature do
  before do
    @hotel1 = Hotel.create(name: 'Hotel One', location: 'Location One')
    @hotel2 = Hotel.create(name: 'Hotel Two', location: 'Location Two')

    @room1 = Room.create(suite: 'Suite A', rate: 100, hotel: @hotel1)
    @room2 = Room.create(suite: 'Suite B', rate: 200, hotel: @hotel2)

    @guest1 = Guest.create(name: 'John Doe', nights: 3)
    @guest2 = Guest.create(name: 'Jane Doe', nights: 2)

    @stay1 = Stay.create(guest: @guest1, room: @room1)
    @stay2 = Stay.create(guest: @guest2, room: @room2)
  end

  # User Story 3 Test
  describe 'rooms show page' do
    it 'can see all room data including distinct guest count' do
      visit room_path(@room1)

      expect(page).to have_content(@room1.rate)
      expect(page).to have_content(@room1.suite)
      expect(page).to have_content(@room1.hotel.name)
      expect(page).to have_content(@room1.distinct_guest_count)
    end
  end
end
