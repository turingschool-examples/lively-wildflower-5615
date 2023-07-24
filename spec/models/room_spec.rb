require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms)}
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

    it "can count how many guests have stayed in the room" do
      expect(@room_1.guest_count).to eq(2)
      expect(@room_2.guest_count).to eq(1)
      expect(@room_4.guest_count).to eq(0)
    end
  end
end