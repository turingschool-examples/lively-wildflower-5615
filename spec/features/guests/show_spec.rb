require "rails_helper"

RSpec.describe "The Guest's Show Page" do
  before(:each) do
    @hotel1 = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @hotel2 = Hotel.create!(name: "North Face Inn", location: "Echo Mountain")
    @room1 = Room.create!(hotel: @hotel1, rate: 120, suite: "Sophomore")
    @room2 = Room.create!(hotel: @hotel1, rate: 100, suite: "Freshman")
    @room3 = Room.create!(hotel: @hotel2, rate: 200, suite: "Presdential")
    @room4 = Room.create!(hotel: @hotel2, rate: 225, suite: "Ambassador")
    @guest1 = Guest.create!(name: "Charlize Theron", nights: 3)
    @guest2 = Guest.create!(name: "Winston Churchill", nights: 2)
    RoomGuest.create!(guest_id: @guest1.id, room_id: @room1.id)
    RoomGuest.create!(guest_id: @guest2.id, room_id: @room2.id)
    RoomGuest.create!(guest_id: @guest1.id, room_id: @room3.id)
    RoomGuest.create!(guest_id: @guest2.id, room_id: @room4.id)
  end

  it "shows the Guest's name and history" do
    visit "/guests/#{@guest1.id}"
    # save_and_open_page
    expect(page).to have_content("Charlize Theron")
  end

  it "has a form to add a new room for this guest" do
    visit "/guests/#{@guest1.id}"
    # save_and_open_page
    expect(page).to have_content("Add a Room")
    fill_in "room_id", with: @room2.id
    click_button "Submit"
    # save_and_open_page
    expect(current_path).to eq("/guests/#{@guest1.id}")
    expect(page).to have_content("Charlize Theron")
  end
end