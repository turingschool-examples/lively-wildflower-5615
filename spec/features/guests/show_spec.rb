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

    it "displays a form to add an exisiting room to a guests show page" do
      @jane.rooms.push(@hyatt_room_3)
      @jane.rooms.push(@daysinn_room_6)
      hyatt_room_8 = @hyatt.rooms.create!(rate: 400, suite: "Executive")

      visit "/guests/#{@jane.id}"

      within("#add_room") do
        fill_in :add_room_id, with: hyatt_room_8.id
        click_button "Submit"
      end

      expect(page).to have_content(@jane.rooms.third.hotel.name)
      expect(@jane.rooms).to eq([@hyatt_room_3, @daysinn_room_6, hyatt_room_8])
      expect(current_path).to eq("/guests/#{@jane.id}")
    end
  end
end