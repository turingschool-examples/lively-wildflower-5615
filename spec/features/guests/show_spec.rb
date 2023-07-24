require 'rails_helper'

RSpec.describe 'guests', type: :feature do

  describe 'GET #show' do

    before(:each) do
      @hotel = Hotel.create(name: 'Green Mountian Inn', location: 'Stowe')
      @room1 = @hotel.rooms.create(rate: 200, suite: 'Super')
      @guest1 = Guest.create(name: 'Kye', nights: 6)
      @guests_room = GuestsRoom.create(guest: @guest1, room: @room1)
    end

    it 'shows guests with information on show page' do
      visit "/guests/#{@guest1.id}"

      expect(page).to have_content(@guest1.name)
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Suite: #{@room1.suite}")
      expect(page).to have_content("Nightly Rate: $#{@room1.rate}")
    end

  end

end
