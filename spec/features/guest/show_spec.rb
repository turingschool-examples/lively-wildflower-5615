require 'rails_helper'

RSpec.describe "Guest Show page" do
  it "displays the guests name" do 
    guest_1 = Guest.create!(name: "Jake Ryan", nights:3)
    hotel_1 = Hotel.create!(name: "Plaza", location: "Meridian Islands")
    room_1 = Room.create!(rate: 130, suite: "Standard", hotel: hotel_1)
    room_2 = Room.create!(rate: 500, suite: "Presidential", hotel: hotel_1)
    guest_1.rooms << room_1
    guest_1.rooms << room_2

    visit "/guests/#{guest_1.id}"

    expect(page).to have_content("Jake Ryan")
end