
require 'rails_helper'

RSpec.describe 'Add a Guest to a Room', type: :feature do
  let(:hotel) { Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain') }
  let(:room) { Room.create(rate: 125, suite: 'Presidential', hotel: hotel) }
  let(:guest) { Guest.create(name: 'Charlize Theron', nights: 3) }

  it 'adds a room to the guest' do
    visit "/guest/#{guest.id}"
    new_room = Room.create(rate: 200, suite: 'Deluxe', hotel: hotel)

    fill_in 'guest_room_room_id', with: new_room.id
    click_button 'Add Room'

    expect(page).to have_content(new_room.suite)
    expect(page).to have_content(new_room.rate)
    expect(page).to have_content(hotel.name)
  end
end
