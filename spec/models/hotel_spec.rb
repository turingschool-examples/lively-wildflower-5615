require "rails_helper"

RSpec.describe Hotel, type: :model do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Hotel California", location: "California")

    @guest_1 = Guest.create!(name: "Jorge", nights: 2)
    @guest_2 = Guest.create!(name: "Nancy", nights: 3)

    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
    @room_2 = @hotel_1.rooms.create!(rate: 500, suite: "Presidential")
    
    # three guest rooms to test for .distinct
    GuestRoom.create!(guest: @guest_1, room: @room_2)
    GuestRoom.create!(guest: @guest_1, room: @room_1)
    GuestRoom.create!(guest: @guest_2, room: @room_1)
  end

  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "#instance_methods" do
    it "can list all guests of the hotel" do
      expect(@hotel_1.list_of_guests).to eq([@guest_1, @guest_2])
    end
  end
end