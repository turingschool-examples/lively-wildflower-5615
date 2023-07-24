require "rails_helper"

RSpec.describe Room, type: :model do
  before :each do 
    @hotel = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @guest_1 = Guest.create!(name: "Charlize", nights: 3)
    @room_1 = @hotel.rooms.create!(rate: 100, suite: "Presidential Suite")
    @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
  end
  describe "relationships" do
    it { should belong_to :hotel }
  end

  describe "relationships" do 
    it { should have_many :guest_rooms }
  end

  describe "relationships" do
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe "instance methods" do 
    it "#guest_count" do 
      expect(@room_1.guest_count).to eq(1)
    end

    it "#hotel_name" do 
      expect(@room_1.hotel_name).to eq("Echo Mountain Inn")
    end
  end
end