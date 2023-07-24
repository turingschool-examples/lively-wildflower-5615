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
  end

  describe "instance methods" do
    it "#hotel_name" do
      expect(@room1.hotel_name).to eq("Vail Inn")
      expect(@room2.hotel_name).to eq("Lionshead Chalet")
    end
  end
end