require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms)}
  end
  before(:each) do
    @emma = Hotel.create!(name: "Hotel Emma", location: "San Antonio")
    @wolf = Hotel.create!(name: "Great Wolf Lodge", location: "Dallas")
    
    @room_1 = @emma.rooms.create!(rate: 500, suite: "Presidential")
    @room_2 = @emma.rooms.create!(rate: 650, suite: "Penthouse")
    @room_3 = @wolf.rooms.create!(rate: 300, suite: "Garden")
    @room_4 = @wolf.rooms.create!(rate: 400, suite: "Animal Kingdom")
    
    @sara = Guest.create!(name: "Sara", nights: 2)
    @leo = Guest.create!(name: "Leo", nights: 3)
    @piper = Guest.create!(name: "Piper", nights: 3)
    @paige = Guest.create!(name: "Paige", nights: 1)

    @room_1.guests << @sara
    @room_1.guests << @paige
    @room_2.guests << @paige
    @room_3.guests << @paige
    @room_4.guests << @sara
  end

  describe "Instance methods" do
    describe "#guest_count" do
      it "counts the number of guests in a room" do 
        expect(@room_1.guest_count).to eq(2)
        expect(@room_2.guest_count).to eq(1)
        expect(@room_3.guest_count).to eq(1)
        expect(@room_4.guest_count).to eq(1)
      end
    end
  end
end