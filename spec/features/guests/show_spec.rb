require "rails_helper"

RSpec.describe "the guests show page" do
  let!(:guest_1) { Guest.create!(name: "Andi", nights: 2) }
  let!(:hotel_1) { Hotel.create!(name: "Sleepy Inn", location: "Colorado") }
  let!(:room_1) { hotel_1.rooms.create!(rate: 125, suite: "Presidential") }
  let!(:room_2) { hotel_1.rooms.create!(rate: 110, suite: "King") }
  let!(:room_3) { hotel_1.rooms.create!(rate: 170, suite: "Luxury") }
  let!(:guest_room_1) { GuestRoom.create!(guest_id: guest_1.id, room_id: room_1.id) }
  let!(:guest_room_2) { GuestRoom.create!(guest_id: guest_1.id, room_id: room_2.id) }

  before do
    visit "/guests/#{guest_1.id}"
  end


  it "shows guest name and list of rooms and room attributes with hotel name" do
    expect(page).to have_content("Guest Name: #{guest_1.name}")
    expect(page).to have_content("Suite: #{room_1.suite}")
    expect(page).to have_content("Nightly Rate: #{room_1.rate}")
    expect(page).to have_content("Suite: #{room_2.suite}")
    expect(page).to have_content("Nightly Rate: #{room_2.rate}")
    expect(page).to have_content("Hotel: #{hotel_1.name}")
    expect(page).to_not have_content("Suite: #{room_3.suite}")
    expect(page).to_not have_content("Nightly Rate: #{room_3.rate}")
  end

  it "has a form for adding a room to a guest" do
    within(".new_room") do
      fill_in :id, with: room_3.id
      click_button "Save"

      expect(current_path).to eq("/guests/#{guest_1.id}")
    end

    expect(page).to have_content("Suite: #{room_3.suite}")
    expect(page).to have_content("Nightly Rate: #{room_3.rate}")
  end
end