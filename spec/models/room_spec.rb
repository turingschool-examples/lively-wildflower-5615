require "rails_helper"

RSpec.describe Room, type: :model do
  before do
    @echo_mountain = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @stanley = Hotel.create!(name: "The Stanley Hotel", location: "Estes Park")

    @room_1 = @echo_mountain.rooms.create!(rate: 125, suite: "Presidential")
    @room_2 = @echo_mountain.rooms.create!(rate: 140, suite: "Honeymoon")
    @room_3 = @echo_mountain.rooms.create!(rate: 100, suite: "Standard")
    @room_4 = @stanley.rooms.create!(rate: 123, suite: "Junior")
    @room_5 = @stanley.rooms.create!(rate: 231, suite: "Penthouse")

    @charlize = Guest.create!(name: "Charlize Theron", nights: 3)
    @david = Guest.create!(name: "David Tennant", nights: 4)
    @jim = Guest.create!(name: "Jim Carrey", nights: 1)

    GuestRoom.create!(guest: @charlize, room: @room_1)
    GuestRoom.create!(guest: @charlize, room: @room_2)
    GuestRoom.create!(guest: @charlize, room: @room_4)
    GuestRoom.create!(guest: @david, room: @room_1)
    GuestRoom.create!(guest: @david, room: @room_2)
    GuestRoom.create!(guest: @david, room: @room_4)
    GuestRoom.create!(guest: @jim, room: @room_1)
    GuestRoom.create!(guest: @jim, room: @room_5)
  end

  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe "#count_guests" do
    it "returns count of guests who've stayed in that room" do
      expect(@room_1.count_guests).to eq(3)
      expect(@room_2.count_guests).to eq(2)
      expect(@room_3.count_guests).to eq(0)
      expect(@room_4.count_guests).to eq(2)
      expect(@room_5.count_guests).to eq(1)
    end
  end
end