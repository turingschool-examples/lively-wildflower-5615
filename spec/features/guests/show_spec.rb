require 'rails_helper'

RSpec.describe "Guests Show Page" do
  before :each do
    @guest_1 = Guest.create!(name: "Charlize Theron", nights: 3)
    @guest_2 = Guest.create!(name: "Beyonce Knowles", nights: 6)
    @guest_3 = Guest.create!(name: "Lucy Liu", nights: 2)
    @guest_4 = Guest.create!(name: "Cameron Diaz", nights: 4)
    @guest_5 = Guest.create!(name: "Jennifer Lopez", nights: 3)
    
    @hotel = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')

    @room_1 = @hotel.rooms.create!(rate: 250, suite: "Presidential")
    @room_2 = @hotel.rooms.create!(rate: 250, suite: "Honeymoon")
    @room_3 = @hotel.rooms.create!(rate: 250, suite: "Slopeside")
    @room_4 = @hotel.rooms.create!(rate: 250, suite: "Sauna")
    @room_5 = @hotel.rooms.create!(rate: 250, suite: "Fireplace")

    @room_guest_1 = RoomGuest.create!(room: @room_1, guest: @guest_5)
    @room_guest_2 = RoomGuest.create!(room: @room_1, guest: @guest_2)
    @room_guest_3 = RoomGuest.create!(room: @room_2, guest: @guest_5)
    @room_guest_4 = RoomGuest.create!(room: @room_3, guest: @guest_1)
    @room_guest_5 = RoomGuest.create!(room: @room_4, guest: @guest_3)
    @room_guest_6 = RoomGuest.create!(room: @room_5, guest: @guest_4)
  end
  it "displays the guests name and room suites they've stayed in" do
    visit "/guests/#{@guest_5.id}"
    
    expect(page).to have_content(@guest_5.name)
    expect(page).to have_content(@room_1.suite)
    
    visit "/guests/#{@guest_3.id}"
    
    expect(page).to have_content(@guest_3.name)
    expect(page).to have_content(@room_4.suite)
  end

  it "displays each room's nightly rate, and the name of the hotel that it belongs to" do
    visit "/guests/#{@guest_5.id}"

    expect(page).to have_content(@room_1.rate)
    expect(page).to have_content(@hotel.name)

    visit "/guests/#{@guest_3.id}"
    
    expect(page).to have_content(@room_4.rate)
    expect(page).to have_content(@hotel.name)
  end
end