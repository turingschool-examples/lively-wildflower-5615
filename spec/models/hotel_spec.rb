require "rails_helper"

RSpec.describe Hotel, type: :model do
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
  end

  describe "relationships" do
    it { should have_many :rooms }
  end

  describe "#guest_list" do
    it "returns a unique list of guests that have stayed there" do
      expect(@echo_mountain.guest_list).to eq("Charlize Theron, David Tennant, Jim Carrey")
      expect(@stanley.guest_list).to eq("Charlize Theron, David Tennant")
    end
  end
end