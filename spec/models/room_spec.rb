require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms)}
  end

  describe "#guest_count" do
    it "counts all of the guests that belong to a room" do
      hotel_1 = Hotel.create!(name: "Aspen Inn", location: "Aspen")
      room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")

      guest_1 = Guest.create!(name: "Charlie Day", nights: 3)
      guest_2 = Guest.create!(name: "Tom Hardy", nights: 5)

      room_1.guests << guest_1
      room_1.guests << guest_2


      expect(room_1.guest_count).to eq(2)
    end
  end
end