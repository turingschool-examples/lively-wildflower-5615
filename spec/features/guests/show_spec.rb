require "rails_helper"

RSpec.describe "/guest/:id", type: :feature do
  before do
    @hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @hotel_2 = Hotel.create!(name: 'Hot Springs Inn', location: 'Hot Springs')
    @hotel_3 = Hotel.create!(name: 'Cherokee Inn', location: 'Cherokee')
    @room_1 = Room.create!(rate: 225, suite: "Presidential")
    @room_2 = Room.create!(rate: 125, suite: "Standard")
    @room_3 = Room.create!(rate: 25, suite: "Closet")
    @guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    @guest_1 = Guest.create!(name: 'James Blake', nights: 4)
    @guest_1 = Guest.create!(name: 'Dan Smith', nights: 2)
  end
end