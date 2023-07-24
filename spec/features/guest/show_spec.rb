require 'rails_helper'

RSpec.describe "Guest Show page" do
  it "displays the guest's name and their rooms' information" do

    @guest_1 = Guest.create!(name: "Jake Ryan", nights: 3)
    @hotel_1 = Hotel.create!(name: "Plaza", location: "Meridian Islands")
    @room_1 = Room.create!(rate: 130, suite: "Standard", hotel: @hotel_1, guest_id: @guest_1.id)
    @room_2 = Room.create!(rate: 500, suite: "Presidential", hotel: @hotel_1, guest_id: @guest_1.id)

    visit "/guests/#{@guest_1.id}"


    expect(page).to have_content("Guest Name: Jake Ryan")


    within("#room-#{room_1.id}") do
      expect(page).to have_content("Suite: Standard")
      expect(page).to have_content("Nightly Rate: $130")
      expect(page).to have_content("Hotel: Plaza, Meridian Islands")
    end


    within("#room-#{room_2.id}") do
      expect(page).to have_content("Suite: Presidential")
      expect(page).to have_content("Nightly Rate: $500")
      expect(page).to have_content("Hotel: Plaza, Meridian Islands")
    end
  end
end