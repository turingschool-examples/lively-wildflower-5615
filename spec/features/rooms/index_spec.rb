
require 'rails_helper'

RSpec.describe 'Rooms Index', type: :feature do
  let(:hotel1) { Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain') }
  let(:hotel2) { Hotel.create(name: 'Alpine Resort', location: 'Alpine Valley') }
  let(:room1) { Room.create(rate: 125, suite: 'Presidential', hotel: hotel1) }
  let(:room2) { Room.create(rate: 200, suite: 'Deluxe', hotel: hotel2) }
  let(:guest1) { Guest.create(name: 'Charlize Theron', nights: 3) }
  let(:guest2) { Guest.create(name: 'Tom Hanks', nights: 2) }

  before do
    GuestRoom.create(guest: guest1, room: room1)
    GuestRoom.create(guest: guest2, room: room2)
  end

  it 'displays a list of all rooms with their details and guest count' do
    visit "/rooms"
    expect(page).to have_content(room1.suite)
    expect(page).to have_content(room1.rate)
    expect(page).to have_content(hotel1.name)
    expect(page).to have_content(room1.guests.count)

    expect(page).to have_content(room2.suite)
    expect(page).to have_content(room2.rate)
    expect(page).to have_content(hotel2.name)
    expect(page).to have_content(room2.guests.count)
  end
end
