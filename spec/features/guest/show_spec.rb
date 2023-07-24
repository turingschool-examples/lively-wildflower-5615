require 'rails_helper'

RSpec.describe "Admin Applications" do
  before :each do
    @hotel_1 = Hotel.create!(name: "Sheraton", location: "Denver")
    @room_1 = @hotel_1.rooms.create!(rate: 50, suite: "2 bedroom")
    @room_2 = @hotel_1.rooms.create!(rate: 100, suite: "Penthouse")
    @guest_1 = @room_1.guests.create!()
  end
#User Story 1
#   As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.

  describe "visits show page" do
    it "shows the guests name and a list of all the rooms they've stayed in"
  end


end