require 'rails_helper'

RSpec.describe Guest do
  #Story 1
  #Guest Show

  #As a visitor
  #When I visit a guest's show page
  #I see the guest's name
  #And I see a list of all the rooms they've stayed in
  it "including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
    @hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
    @room_1 = Room.create!(rate: 100, suite: "Redrum", hotel: @hotel_1)
    @room_2 = Room.create!(rate: 200, suite: "Presedential", hotel: @hotel_1)
    @guest_1 = Guest.create!(name: "Jack Torrance", nights: 2)
    @guest_1.rooms << @room_1
    @guest_1.rooms << @room_2
    

    visit "/guests/#{@guest_1.id}"

    expect(page).to have_content(@guest_1.name)
    expect(page).to have_content(@room_1.suite)
    expect(page).to have_content(@room_1.rate)
    expect(page).to have_content(@room_2.suite)
    expect(page).to have_content(@room_2.rate)
    expect(page).to have_content(@hotel_1.name)
  end
end