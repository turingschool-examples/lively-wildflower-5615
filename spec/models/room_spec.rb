require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many :guests }
  end

  describe "Instance Methods" do
    before :each do
      @plaza = Hotel.create!(name: "The Plaza", location: "New York")
      @ritz = Hotel.create!(name: "Hotel Ritz", location: "Paris")
      @beverly = Hotel.create!(name: "Beverly Hills Hotel", location: "California")
      
      @room_1 = @plaza.rooms.create!(rate: 600, suite: "Presidential")
      @room_2 = @ritz.rooms.create!(rate: 850, suite: "Eiffiel Tower View")
      @room_3 = @beverly.rooms.create!(rate: 500, suite: "Madonna Suite")
      @room_4 = @beverly.rooms.create!(rate: 750, suite: "Judy Garland Suite")

      @guest_1 = Guest.create!(name: "Manila Luzon", nights: 3)
      @guest_2 = Guest.create!(name: "Latrice Royal", nights: 2)
      @guest_3 = Guest.create!(name: "Monet Exchange", nights: 5)
      @guest_4 = Guest.create!(name: "Kasha Davis", nights: 7)
      @guest_5 = Guest.create!(name: "Milk", nights: 4)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_1.id)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)

      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_3.id)
      GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_3.id)

      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_4.id)
      GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_4.id)
    end

    it "counts number of guests who have stayed in the room" do
      expect(@room_1.prev_guest_count).to eq(4)
      expect(@room_2.prev_guest_count).to eq(2)
      expect(@room_3.prev_guest_count).to eq(3)
      expect(@room_4.prev_guest_count).to eq(2)
    end
  end
end