require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "Instance Methods" do
    before :each do
      @beverly = Hotel.create!(name: "Beverly Hills Hotel", location: "California")
      
      @room_1 = @beverly.rooms.create!(rate: 500, suite: "Madonna Suite")
      @room_2 = @beverly.rooms.create!(rate: 750, suite: "Judy Garland Suite")

      @guest_1 = Guest.create!(name: "Manila Luzon", nights: 3)
      @guest_2 = Guest.create!(name: "Latrice Royal", nights: 2)
      @guest_3 = Guest.create!(name: "Monet Exchange", nights: 5)
      @guest_4 = Guest.create!(name: "Kasha Davis", nights: 7)
      @guest_5 = Guest.create!(name: "Anetra", nights: 4)
      @guest_6 = Guest.create!(name: "Benda La Creme", nights: 1)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_1.id)
      GuestRoom.create!(guest_id: @guest_5.id, room_id: @room_1.id)

      GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_2.id)
      GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_2.id)
    end

    it 'can create a unique list of all previous guests who have stayed within the hotels rooms' do
      expected = [@guest_5.name, @guest_4.name, @guest_2.name, @guest_1.name, @guest_3.name]

      expect(@beverly.prev_guests.sort).to eq(expected)
    end
  end
end