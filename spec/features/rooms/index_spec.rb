require "rails_helper"

RSpec.describe "The Room", type: :feature do
  before(:each) do
    test_data
  end
  describe "#index page" do
    it "displays all rooms, their rates/suites, the hotel and the number of guests per room" do
      @hank.rooms.push(@hyatt_room_3)
      @jane.rooms.push(@hyatt_room_3)
      @barbie.rooms.push(@hyatt_room_3)

      @barbie.rooms.push(@daysinn_room_6)
      @billy.rooms.push(@daysinn_room_6)

      @hank.rooms.push(@daysinn_room_5)

      visit "/rooms"

      expect(page).to have_content(@motel_8_room_1.hotel.name)
      expect(page).to have_content(@motel_8_room_1.rate)
      expect(page).to have_content(@motel_8_room_1.suite)

      expect(page).to have_content(@hyatt_room_3.hotel.name)
      expect(page).to have_content(@hyatt_room_3.rate)
      expect(page).to have_content(@hyatt_room_3.suite)
      expect(page).to have_content(@hyatt_room_3.guest_count)
      
      expect(page).to have_content(@daysinn_room_6.hotel.name)
      expect(page).to have_content(@daysinn_room_6.rate)
      expect(page).to have_content(@daysinn_room_6.suite)
      expect(page).to have_content(@daysinn_room_6.guest_count)
      
      expect(page).to have_content(@daysinn_room_5.hotel.name)
      expect(page).to have_content(@daysinn_room_5.rate)
      expect(page).to have_content(@daysinn_room_5.suite)
      expect(page).to have_content(@daysinn_room_5.guest_count)
    end
  end
end