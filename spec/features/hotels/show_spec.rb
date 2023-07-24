require "rails_helper"

RSpec.describe "The Hotel", type: :feature do
  before(:each) do
    test_data
  end
  describe "#show page" do
    it "displays a DISTINCT list of guests that have stayed" do
      @hank.rooms.push(@hyatt_room_3)
      @jane.rooms.push(@hyatt_room_3)
      @barbie.rooms.push(@hyatt_room_3)
      
      visit "/hotels/#{@hyatt.id}"
      # require 'pry'; binding.pry
      save_and_open_page
      expect(page).to have_content(@hyatt_room_3.guests.first.name)
      expect(page).to have_content(@hyatt_room_3.guests.second.name)
      expect(page).to have_content(@hyatt_room_3.guests.third.name)
      
      @barbie.rooms.push(@hyatt_room_3)

      expect(page).to_not have_content("Barbie", count: 2)
    end
  end
end