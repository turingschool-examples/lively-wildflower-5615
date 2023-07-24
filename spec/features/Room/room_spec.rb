require 'rails_helper'

RSpec.describe 'Room Index', type: :feature do 
  before :each do
    @hotel = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @guest_1 = Guest.create!(name: "Charlize", nights: 3)

    @guest_2 = Guest.create!(name: "Hank", nights: 5)

    @room_1 = @hotel.rooms.create!(rate: 100, suite: "Presidential Suite")
    @room_2 = @hotel.rooms.create!(rate: 50, suite: "Honeymoon Suite")

    @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
  end

  it 'displays all rooms and their attributes' do 

    visit "/rooms"

    expect(page).to have_content(@room_1.suite)
    expect(page).to have_content(@room_1.rate)
    expect(page).to have_content(@room_2.suite)
    expect(page).to have_content(@room_2.rate)
    
    expect(page).to have_content("Echo Mountain Inn")
    expect(page).to have_content(1)
  end
end