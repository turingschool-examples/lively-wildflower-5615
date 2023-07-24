require "rails_helper"

RSpec.describe "The Guest Show Page", type: :feature do
  before(:each) do
    @hotel = Hotel.create!(name:"Vail Inn", location:"Vail")

    @room1 = @hotel.rooms.create!(rate: 125, suite: "Presidential")
    @room2 = @hotel.rooms.create!(rate: 130, suite: "Executive")
    @room3 = @hotel.rooms.create!(rate: 100, suite: "Basic")
    
    @guest1 = Guest.create!(name: "Ethan", nights: 3)
    @guest2 = Guest.create!(name: "Zahava", nights: 3)
    @guest3 = Guest.create!(name: "Ezzy", nights: 1)

    @room1.guests << @guest1
    @room1.guests << @guest2
    
    @room2.guests << @guest1
    @room2.guests << @guest3

    @room3.guests << @guest1
  end

  it "I see a guest's name" do
    visit "/guests/#{@guest1.id}"
    
    within("div#guest-info") do
      expect(page).to have_content(@guest1.name)
      expect(page).to_not have_content(@guest2.name)
    end
    
    visit "/guests/#{@guest2.id}"
    
    within("div#guest-info") do
      expect(page).to have_content(@guest2.name)
      expect(page).to_not have_content(@guest1.name)
    end
  end

  xit "I see a list of all the rooms they've stayed in" do

  end

  xit "Each listed room includes the room's suite, nightly rate, and the name of the hotel to which it belongs" do

  end
end