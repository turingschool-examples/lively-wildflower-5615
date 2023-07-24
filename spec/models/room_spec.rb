require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
  end

  describe "#number_of_guests" do
    it "counts the number of guests a room has had" do
      @hotel_1 = Hotel.create!(name: "Sheraton", location: "Denver")
      @room_1 = @hotel_1.rooms.create!(rate: 50, suite: "2 bedroom")
      @guest_1 = @room_1.guests.create!(name: "Steve", nights: 3)
      @guest_2 = @room_1.guests.create!(name: "Carl", nights: 3)

      expect(@room_1.number_of_guests).to eq(2)
    end
  end
end