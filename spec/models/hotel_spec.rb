require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "#list_unique_guests" do
    it "lists the names of all guests that have stayed in the hotel without repeating" do
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

      expect(@hotel_1.list_unique_guests).to eq([@guest_1, @guest_2, @guest_3])
    end
  end
end