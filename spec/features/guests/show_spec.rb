require "rails_helper"

RSpec.describe "The Guest", type: :feature do
  before(:each) do
    test_data
  end
  describe "#show page" do
    it "displays the guests name and all info about the rooms stayed in" do
      @billy.rooms.push(@motel_8_room_1)
      @billy.rooms.push(@daysinn_room_5)

      visit "/guests/#{@billy.id}"

      expect(page).to have_content(@billy.name)

      expect(page).to have_content(@billy.rooms.first.hotel.name)
      expect(page).to have_content(@billy.rooms.first.rate)
      expect(page).to have_content(@billy.rooms.first.suite)

      expect(page).to have_content(@billy.rooms.second.hotel.name)
      expect(page).to have_content(@billy.rooms.second.rate)
      expect(page).to have_content(@billy.rooms.second.suite)
    end
  end
end