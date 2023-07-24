require 'rails_helper'

RSpec.describe Guest, type: :feature do
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

  # User Story 1 Test
  describe 'guests show page' do
    it 'can see all guest data' do
      visit guest_path(@guest1)

      expect(page).to have_content(@guest1.name)
      expect(page).to have_content(@guest1.nights)
      expect(page).to have_content(@stay1.room.suite)
      expect(page).to have_content(@stay1.room.rate)
      expect(page).to have_content(@stay1.room.hotel.name)
    end

    it 'can add a room to a guest' do
      visit guest_path(@guest1)

      expect(page).to have_content('Add a Room to this Guest')
      fill_in 'room_id', with: @room2.id
      click_button 'Add Room to Guest'

      expect(current_path).to eq(guest_path(@guest1))
      expect(page).to have_content(@stay2.room.suite)
    end
  end
end
