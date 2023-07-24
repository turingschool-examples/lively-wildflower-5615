require 'rails_helper'

RSpec.describe "Visitor Index" do

  before :each do
    @hotel_1 = Hotel.create!(name: "Sheraton", location: "Denver")
    @room_1 = @hotel_1.rooms.create!(rate: 50, suite: "2 bedroom")
    @room_2 = @hotel_1.rooms.create!(rate: 100, suite: "Penthouse")
    @guest_1 = @room_1.guests.create!(name: "Steve", nights: 3)
    @guest_2 = @room_1.guests.create!(name: "Carl", nights: 3)
    @room_3 = @hotel_1.rooms.create!(rate: 25, suite: "1 bedroom")
    @guest_3 = @room_1.guests.create!(name: "Greg", nights: 3)
    #GuestRoom.create!(rooms_id: @room_1.id, guests_id: @guest_1.id)
  end

  it 'shows all the rooms, room details, guests that stayed in each room' do
    visit "/rooms" 
    save_and_open_page
    expect(page).to have_content(@room_1.rate)
    expect(page).to have_content(@room_1.suite)
    expect(page).to have_content(@room_1.hotel.name)
    expect(page).to have_content(@room_2.rate)
    expect(page).to have_content(@room_2.suite)
    expect(page).to have_content(@room_2.hotel.name)
    expect(page).to have_content(3)
    #I know I can use within blocks, I'm just writing the tests fast
  end
end


#User Story 3
    #     As a visitor
    # When I visit the rooms index page
    # Then I see a list of all rooms
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to
    # and the number of guests that have stayed in that room.
    