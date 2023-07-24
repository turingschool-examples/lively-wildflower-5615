require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
    it {should have_many(:room_guests).through(:rooms)}
    it {should have_many(:guests).through(:room_guests)}
  end

  before(:each) do
    @hotel1 = Hotel.create!(name:"Vail Inn", location:"Vail")
    @hotel2 = Hotel.create!(name:"Lionshead Chalet", location:"Lionshead")

    @room1 = @hotel1.rooms.create!(rate: 125, suite: "Presidential")
    @room2 = @hotel1.rooms.create!(rate: 130, suite: "Executive")
    @room3 = @hotel1.rooms.create!(rate: 100, suite: "Basic")
    @room4 = @hotel2.rooms.create!(rate: 200, suite: "Pineapple")
    @room5 = @hotel2.rooms.create!(rate: 75, suite: "Below Average")

    @guest1 = Guest.create!(name: "Ethan", nights: 3)
    @guest2 = Guest.create!(name: "Zahava", nights: 3)
    @guest3 = Guest.create!(name: "Ezzy", nights: 1)
    @guest4 = Guest.create!(name: "Jonathan", nights: 1)
    @guest5 = Guest.create!(name: "Greg", nights: 1)
    @guest6 = Guest.create!(name: "Elana", nights: 1)

    @room1.guests << @guest1
    @room1.guests << @guest2
    @room1.guests << @guest3
    
    @room2.guests << @guest1
    @room2.guests << @guest3
    @room2.guests << @guest4
    @room2.guests << @guest5
    
    @room3.guests << @guest1
    @room3.guests << @guest6

    @room4.guests << @guest1
    @room4.guests << @guest2

    @room5.guests << @guest2
    @room5.guests << @guest3
  end

  describe "instance methods" do
    it "#unique_guests" do
      expect(@hotel1.unique_guests).to match_array([@guest1, @guest2, @guest3, @guest4, @guest5, @guest6])
      expect(@hotel2.unique_guests).to match_array([@guest1, @guest2, @guest3])
    end
  end
end