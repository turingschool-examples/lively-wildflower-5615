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

  describe 'guests index page' do
    it 'can see all guests' do
      visit guests_path

      expect(page).to have_content(@guest1.name)
      expect(page).to have_content(@guest1.nights)
      expect(page).to have_content(@guest2.name)
      expect(page).to have_content(@guest2.nights)
    end
  end
end
