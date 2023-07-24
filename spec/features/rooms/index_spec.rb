require "rails_helper"

RSpec.describe "the rooms index" do
  let!(:guest_1) { Guest.create!(name: "Andi", nights: 2) }
  let!(:guest_2) { Guest.create!(name: "Bob", nights: 2) }
  let!(:hotel_1) { Hotel.create!(name: "Sleepy Inn", location: "Colorado") }
  let!(:room_1) { hotel_1.rooms.create!(rate: 125, suite: "Presidential") }
  let!(:room_2) { hotel_1.rooms.create!(rate: 110, suite: "King") }
  let!(:room_3) { hotel_1.rooms.create!(rate: 170, suite: "Luxury") }
  let!(:guest_room_1) { GuestRoom.create!(guest_id: guest_1.id, room_id: room_1.id) }
  let!(:guest_room_2) { GuestRoom.create!(guest_id: guest_1.id, room_id: room_2.id) }
  let!(:guest_room_3) { GuestRoom.create!(guest_id: guest_2.id, room_id: room_1.id) }
  let!(:guest_room_4) { GuestRoom.create!(guest_id: guest_2.id, room_id: room_3.id) }
  
  before do
    visit "/rooms"
  end

  
  it "lists all the rooms with room attributes and number of guests" do
    within(".room-#{room_1.id}") do
      expect(page).to have_content(room_1.suite)
      expect(page).to have_content(room_1.rate)
      expect(page).to have_content(hotel_1.name)
      expect(page).to have_content("Total Guests: 2")
    end

    within(".room-#{room_2.id}") do
      expect(page).to have_content(room_2.suite)
      expect(page).to have_content(room_2.rate)
      expect(page).to have_content(hotel_1.name)
      expect(page).to have_content("Total Guests: 1")
    end

    within(".room-#{room_3.id}") do
      expect(page).to have_content(room_3.suite)
      expect(page).to have_content(room_3.rate)
      expect(page).to have_content(hotel_1.name)
      expect(page).to have_content("Total Guests: 1")
    end
  end
end