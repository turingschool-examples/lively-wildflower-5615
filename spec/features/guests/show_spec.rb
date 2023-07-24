require "rails_helper"

RSpec.describe "guests show page" do

# Story 1
# Guest Show
# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, 
# and the name of the hotel that it belongs to.

  it "displays the guest's name" do
    hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen" )
    room_1 = Room.create!(rate: 125, suite: "Presidential")
    guest_1 = Guest.create!(name: "Charlie Day", nights: 3)

    visit "/guests/#{guest_1.id}"

    expect(page).to have_content("Charlie Day")
  end

  it "has a list of all the rooms they've stayed in with nightly rate, suite and hotel affiliation" do
    hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen" )
    room_1 = Room.create!(rate: 125, suite: "Presidential")
    room_2 = Room.create!(rate: 150, suite: "Honeymoon")
    guest_1 = Guest.create!(name: "Charlie Day", nights: 3)

    visit "/guests/#{guest_1.id}"

    expect(page).to have_content("Suite: Presidential")
    expect(page).to have_content("Rate: 125")
    expect(page).to have_content("Suite: Honeymoon")
    expect(page).to have_content("Rate: 150")
    expect(page).to have_content("Aspen Inn")
  end
end