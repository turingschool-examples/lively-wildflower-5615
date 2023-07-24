require "rails_helper"

RSpec.describe Room, type: :model do
  before(:each) do
    test_data
  end
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many(:guest_rooms) }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe "instance methods" do
    it "#guest_count" do
      @hank.rooms.push(@hyatt_room_3)
      @jane.rooms.push(@hyatt_room_3)
      @barbie.rooms.push(@hyatt_room_3)

      @barbie.rooms.push(@daysinn_room_6)
      @billy.rooms.push(@daysinn_room_6)

      expect(@hyatt_room_3.guest_count).to eq(3)
      expect(@daysinn_room_6.guest_count).to eq(2)
      expect(@hyatt_room_4.guest_count).to eq(0)
    end

    it "#guests_distinct" do
      @hank.rooms.push(@hyatt_room_3)
      @hank.rooms.push(@hyatt_room_3)
      @hank.rooms.push(@hyatt_room_3)
      @barbie.rooms.push(@hyatt_room_3)

      expect(@hyatt_room_3.guests_distinct).to eq([@hank, @barbie])
    end
  end
end