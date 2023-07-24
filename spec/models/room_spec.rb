require "rails_helper"

RSpec.describe Room, type: :model do

  
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
  end
  
  describe "instance methods" do
    let!(:guest_1) { Guest.create!(name: "Andi", nights: 2) }
    let!(:guest_2) { Guest.create!(name: "Bob", nights: 2) }
    let!(:hotel_1) { Hotel.create!(name: "Sleepy Inn", location: "Colorado") }
    let!(:room_1) { hotel_1.rooms.create!(rate: 125, suite: "Presidential") }
    let!(:room_2) { hotel_1.rooms.create!(rate: 110, suite: "King") }
    let!(:room_3) { hotel_1.rooms.create!(rate: 170, suite: "Luxury") }
    let!(:guest_room_1) { GuestRoom.create!(guest_id: guest_1.id, room_id: room_1.id) }
    let!(:guest_room_2) { GuestRoom.create!(guest_id: guest_1.id, room_id: room_2.id) }
    let!(:guest_room_3) { GuestRoom.create!(guest_id: guest_2.id, room_id: room_1.id) }
    let!(:guest_room_4) { GuestRoom.create!(guest_id: guest_2.id, room_id: room_3.id) }

    describe ".total_guests" do
      it "returns the number of guests" do
        expect(room_1.total_guests).to eq(2)
        expect(room_2.total_guests).to eq(1)
        expect(room_3.total_guests).to eq(1)
      end
    end
  end
end