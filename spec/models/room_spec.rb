require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it {should have_many :guest_rooms}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  describe "#guest_count" do
    it "can return the count of guests that have stayed in a room" do
      @hotel_1 = Hotel.create!(name: "Stanley Hotel", location: "Estes Park")
      @room_1 = Room.create!(rate: 100, suite: "Redrum", hotel: @hotel_1)
      @room_2 = Room.create!(rate: 200, suite: "Presedential", hotel: @hotel_1)
      @room_3 = Room.create!(rate: 300, suite: "Regular", hotel: @hotel_1)
      @guest_1 = Guest.create!(name: "Jack Torrance", nights: 2)
      @guest_2 = Guest.create!(name: "Dick Halloran", nights: 3)
      @guest_3 = Guest.create!(name: "Wendy Torrance", nights: 4)

      @guest_1.rooms << @room_1

      @guest_1.rooms << @room_2
      @guest_2.rooms << @room_2

      @guest_1.rooms << @room_3
      @guest_2.rooms << @room_3
      @guest_3.rooms << @room_3

      expect(@room_1.guest_count).to eq(1)
      expect(@room_2.guest_count).to eq(2)
      expect(@room_3.guest_count).to eq(3)
    end
  end
end