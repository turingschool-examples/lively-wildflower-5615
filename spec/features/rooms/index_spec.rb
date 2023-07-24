require "rails_helper"

RSpec.describe "index spec" do
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

    @room_4.guests << @sara
    @room_1.guests << @sara
    @room_2.guests << @paige
    @room_1.guests << @paige
  end
#user story 3
  describe " When I visit the rooms index page" do
    it "has a list of all rooms and its attributes and its hotel" do
      visit "/rooms"

      expect(page).to have_content(@room_1.suite)
      expect(page).to have_content(@room_2.suite)
      expect(page).to have_content(@room_3.suite)
      expect(page).to have_content(@room_4.suite)
      expect(page).to have_content(@room_1.rate)
      expect(page).to have_content(@room_2.rate)
      expect(page).to have_content(@room_3.rate)
      expect(page).to have_content(@room_4.rate)
      expect(page).to have_content(@room_1.hotel.name)
      expect(page).to have_content(@room_2.hotel.name)
      expect(page).to have_content(@room_3.hotel.name)
      expect(page).to have_content(@room_4.hotel.name)
    end

    it " show the number of guests that stayed in each room" do 
      visit "/rooms"

      expect(page).to have_content(@room_1.suite)
      expect(page).to have_content(@room_1.rate)
      expect(page).to have_content(@room_1.hotel.name)
      # Idk how you guys want that tested here so heres 3 ways
      expect(page).to have_content(@room_1.guests.count)
      expect(page).to have_content("Guest Count: 2")
      expect(page).to have_content(@room_1.guest_count)
      expect(page).to have_content(@room_2.guest_count)
      expect(page).to have_content(@room_3.guest_count)
      expect(page).to have_content(@room_4.guest_count)
    end
  end
end