require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it {should belong_to :hotel}
    it {should have_many :room_guests}
    it {should have_many(:guests).through(:room_guests)}
  end

  before(:each) do
    @hotel1 = Hotel.create!(name:"Vail Inn", location:"Vail")
    @hotel2 = Hotel.create!(name:"Lionshead Chalet", location:"Lionshead")

    @room1 = @hotel1.rooms.create!(rate: 125, suite: "Presidential")
    @room2 = @hotel2.rooms.create!(rate: 130, suite: "Executive")

    @guest1 = Guest.create!(name: "Ethan", nights: 3)
    @guest2 = Guest.create!(name: "Zahava", nights: 3)
    @guest3 = Guest.create!(name: "Ezzy", nights: 1)
    @guest4 = Guest.create!(name: "Jonathan", nights: 1)
    @guest5 = Guest.create!(name: "Greg", nights: 1)
    @guest6 = Guest.create!(name: "Elana", nights: 1)

    @room1.guests << @guest1
    @room1.guests << @guest2
    @room1.guests << @guest3
    @room1.guests << @guest4
    @room1.guests << @guest5
    
    @room2.guests << @guest5
    @room2.guests << @guest6
  end

  describe "instance methods" do
    it "#hotel_name" do
      expect(@room1.hotel_name).to eq("Vail Inn")
      expect(@room2.hotel_name).to eq("Lionshead Chalet")
    end

    it "#total_guests" do
      expect(@room1.total_guests).to eq 5
      expect(@room2.total_guests).to eq 2
    end
  end
end