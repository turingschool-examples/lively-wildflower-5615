require "rails_helper"

RSpec.describe Room, type: :model do
    before(:each) do
      @hotel_1 = Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      @hotel_2 = Hotel.create(name: 'Dead Inn', location: 'Lonely Road')
      
      @room_1 = @hotel_1.rooms.create(rate: 125, suite: "Presidential")
      @room_2 = @hotel_1.rooms.create(rate: 50, suite: "Budget")
      @room_3 = @hotel_2.rooms.create(rate: 125, suite: "Presidential")
      @room_4 = @hotel_2.rooms.create(rate: 75, suite: "Standard")

      @guest_1 = Guest.create(name: 'Charlize Theron', nights: 3)
      @guest_2 = Guest.create(name: 'Billy', nights: 1)
      @guest_3 = Guest.create(name: 'Timbo', nights: 3)
      @guest_4 = Guest.create(name: 'Jim', nights: 5)
      @guest_5 = Guest.create(name: 'Mary', nights: 4)
      @guest_6 = Guest.create(name: 'Tammy', nights: 4)

      GuestRoom.create(room_id: @room_1.id, guest_id: @guest_1.id)
      GuestRoom.create(room_id: @room_1.id, guest_id: @guest_2.id)
      GuestRoom.create(room_id: @room_1.id, guest_id: @guest_3.id)
      GuestRoom.create(room_id: @room_2.id, guest_id: @guest_2.id)
      GuestRoom.create(room_id: @room_2.id, guest_id: @guest_4.id)
      GuestRoom.create(room_id: @room_3.id, guest_id: @guest_2.id)
  end

  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guest).through(:guest_rooms)}
  end

  describe "#guest_count" do
    it 'returns the count of guest for that room' do
      expect(@room_1.guest_count).to eq(3)
      expect(@room_2.guest_count).to eq(2)
      expect(@room_3.guest_count).to eq(1)
    end
  end
end