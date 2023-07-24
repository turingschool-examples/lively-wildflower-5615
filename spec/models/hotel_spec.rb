require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "instance methods" do
    before :each do
      @hotel_1 = Hotel.create!(
        name: "Hilton",
        location: "SLC, UT")
      @hotel_2 = Hotel.create!(
        name: "Hyatt",
        location: "Denver, CO")
  
      @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
      @room_2 = @hotel_1.rooms.create!(rate: 175, suite: "Deluxe")
      @room_3 = @hotel_2.rooms.create!(rate: 90, suite: "Single bed")
      @room_4 = @hotel_2.rooms.create!(rate: 135, suite: "Master")
      
      @guest_1 = Guest.create!(name: "Phillip", nights: 3)
      @guest_2 = Guest.create!(name: "Phillipa", nights: 7)
      @guest_3 = Guest.create!(name: "Jamie", nights: 10)
      @guest_4 = Guest.create!(name: "Jamison", nights: 14)
  
      @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
      @guest_room_2 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)
      @guest_room_3 = GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_3.id)
      @guest_room_4 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
      @guest_room_5 = GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_1.id)
    end

    it "can provide a unique list of guests that have stayed in the hotel" do
      expect(@hotel_1.guest_list).to eq([@guest_1, @guest_3])
      expect(@hotel_2.guest_list).to eq([@guest_2, @guest_3])
    end
  end
end