require "rails_helper"

RSpec.describe "The Room Index Page" do
  before do
    @hotel1 = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @hotel2 = Hotel.create!(name: "North Face Inn", location: "Echo Mountain")
    @room1 = Room.create!(hotel: @hotel1, rate: 120, suite: "Sophomore")
    @room2 = Room.create!(hotel: @hotel1, rate: 100, suite: "Freshman")
    @room3 = Room.create!(hotel: @hotel2, rate: 200, suite: "Presdential")
    @room4 = Room.create!(hotel: @hotel2, rate: 225, suite: "Ambassador")
    @guest1 = Guest.create!(name: "Charlize Theron", nights: 3)
    @guest2 = Guest.create!(name: "Winston Churchill", nights: 2)
    RoomGuest.create!(guest_id: @guest1.id, room_id: @room2.id)
    RoomGuest.create!(guest_id: @guest1.id, room_id: @room4.id)
    RoomGuest.create!(guest_id: @guest2.id, room_id: @room1.id)
    RoomGuest.create!(guest_id: @guest2.id, room_id: @room4.id)
  end

  it "shows list of all rooms and information about each room" do
    visit "/rooms"
    # save_and_open_page
    within("#room-#{@room1.id}") do
      expect(page).to have_content("--- Suite: Sophomore --- Hotel: Echo Mountain Inn --- Room Guests: 1")
      expect(page).to have_content("Winston Churchill")
    end

    within("#room-#{@room2.id}") do
      expect(page).to have_content("--- Suite: Freshman --- Hotel: Echo Mountain Inn --- Room Guests: 1")
      expect(page).to have_content("Charlize Theron")
    end

    within("#room-#{@room3.id}") do
      expect(page).to have_content("--- Suite: Presdential --- Hotel: North Face Inn --- Room Guests: 0")
      expect(page).to_not have_content("Winston Churchill")
      expect(page).to_not have_content("Charlize Theron")
    end

    within("#room-#{@room4.id}") do
      expect(page).to have_content("--- Suite: Ambassador --- Hotel: North Face Inn --- Room Guests: 2")
      expect(page).to have_content("Winston Churchill")
      expect(page).to have_content("Charlize Theron")
    end
  end
end