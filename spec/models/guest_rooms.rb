require "rails_helper"

RSpec.describe GuestRoom, type: :model do
  it '#create' do
    @hotel_1 = Hotel.create!(name: "Sheraton", location: "Denver")
    @room_1 = @hotel_1.rooms.create!(rate: 50, suite: "2 bedroom")
    @guest_1 = @room_1.guests.create!(name: "Steve", nights: 3)

end