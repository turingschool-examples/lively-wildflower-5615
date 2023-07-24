
require 'rails_helper'

RSpec.describe 'Guest Show', type: :feature do
  let(:hotel) { Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain') }
  let(:room) { Room.create(rate: 125, suite: 'Presidential', hotel: hotel) }
  let(:guest) { Guest.create(name: 'Charlize Theron', nights: 3) }

  before do
    GuestRoom.create(guest: guest, room: room)
  end

  it 'displays the guest name and their rooms' do
    visit "/guest/#{guest.id}"
    
    expect(page).to have_content(guest.name)
    expect(page).to have_content(room.suite)
    expect(page).to have_content(room.rate)
    expect(page).to have_content(hotel.name)
  end

  it 'allows adding a room to the guest' do
    new_room = Room.create(rate: 200, suite: 'Deluxe', hotel: hotel)

    visit "/guest/#{guest.id}"
    fill_in 'guest_room_room_id', with: new_room.id
    click_button 'Add Room'

    expect(page).to have_content(new_room.suite)
    expect(page).to have_content(new_room.rate)
    expect(page).to have_content(hotel.name)
  end
end
