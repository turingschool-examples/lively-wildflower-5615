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

  #Add a Guest to a Room
  #(You do not have to test for a sad path, for example if the ID submitted is not an existing room)

  #As a visitor
  #When I visit a guest's show page
  #Then I see a form to add a room to this guest.
  #When I fill in a field with the id of an existing room
  #And I click submit
  #Then I am redirected back to the guest's show page
  it "And I see the room now listed under this guest's rooms." do
    @hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
    @room_1 = Room.create!(rate: 100, suite: "Redrum", hotel: @hotel_1)
    @room_2 = Room.create!(rate: 200, suite: "Presedential", hotel: @hotel_1)
    @room_3 = Room.create!(rate: 300, suite: "Regular", hotel: @hotel_1)
    @guest_1 = Guest.create!(name: "Jack Torrance", nights: 2)
    @guest_1.rooms << @room_1
    @guest_1.rooms << @room_2


    visit "/guests/#{@guest_1.id}"

    expect(page).to_not have_content(@room_3.suite)
    expect(page).to_not have_content(@room_3.rate)

    fill_in :room_id, with: @room_3.id
    click_button "Submit"
    
    expect(page).to have_content(@room_3.suite)
    expect(page).to have_content(@room_3.rate)
    expect(@guest_1.rooms).to eq([@room_1, @room_2, @room_3])
    expect(current_path).to eq("/guests/#{@guest_1.id}")
  end
end