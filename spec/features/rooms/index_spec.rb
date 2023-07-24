require 'rails_helper'

RSpec.describe 'Rooms Index', type: :feature do
  before(:each) do
    @hotel = Hotel.create(name: 'Green Mountain Inn', location: 'Stowe')
    
    @room1 = @hotel.rooms.create(rate: 200, suite: 'Super')
    @room2 = @hotel.rooms.create(rate: 100, suite: 'Deluxe')

    @guest1 = Guest.create(name: 'Kye', nights: 6)
    @guest2 = Guest.create(name: 'Martha', nights: 2)

    GuestsRoom.create(guest: @guest1, room: @room1)
    GuestsRoom.create(guest: @guest2, room: @room2)
  end

  it "displays a list of all rooms with suite, nightly rate, hotel name, and number of guests" do
    visit "/rooms"

    expect(page).to have_content(@room1.suite)
    expect(page).to have_content(@room1.rate)
    expect(page).to have_content(@room1.hotel.name)
    expect(page).to have_content(@room1.guests.count)

    expect(page).to have_content(@room2.suite)
    expect(page).to have_content(@room2.rate)
    expect(page).to have_content(@room2.hotel.name)
    expect(page).to have_content(@room2.guests.count)
  end
end