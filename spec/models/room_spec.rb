require "rails_helper"

RSpec.describe Room, type: :model do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Hotel California", location: "California")

    @guest_1 = Guest.create!(name: "Jorge", nights: 2)
    @guest_2 = Guest.create!(name: "Nancy", nights: 3)

    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
    
    GuestRoom.create!(guest: @guest_1, room: @room_1)
    GuestRoom.create!(guest: @guest_2, room: @room_1)
  end

  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe "#instance_methods" do
    describe "number_of_guests" do
      it "can return the number of guests that have stayed in that room" do
        expect(@room_1.number_of_guests).to eq(2)
      end
    end
  end
end
