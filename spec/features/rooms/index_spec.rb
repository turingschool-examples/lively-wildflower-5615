require "rails_helper"

RSpec.describe "Rooms Index Page", type: :feature do
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

    @room1.guests << @guest1
    @room1.guests << @guest2
    @room1.guests << @guest3
    
    @room2.guests << @guest1
    @room2.guests << @guest3

    @room3.guests << @guest1
  end

  it "I see a list of all the rooms" do
    visit "/rooms"

    within("div#all-rooms") do
      expect(page).to have_css("div#room-#{@room1.id}")
      expect(page).to have_css("div#room-#{@room2.id}")
      expect(page).to have_css("div#room-#{@room3.id}")
      expect(page).to have_css("div#room-#{@room4.id}")
      expect(page).to have_css("div#room-#{@room5.id}")

      expect(page).to have_content(@room1.suite)
      expect(page).to have_content(@room2.suite)
      expect(page).to have_content(@room3.suite)
      expect(page).to have_content(@room4.suite)
      expect(page).to have_content(@room5.suite)
    end
  end

  it "Each listed room includes the rooms suite, nightly rate, the name of the hotel to which it belongs" do
    visit "/rooms"

    within("div#all-rooms") do
      within("div#room-#{@room1.id}") do
        expect(page).to have_content(@room1.suite)
        expect(page).to have_content(@room1.rate)
        expect(page).to have_content(@hotel1.name)
      end
    
      within("div#room-#{@room2.id}") do
        expect(page).to have_content(@room2.suite)
        expect(page).to have_content(@room2.rate)
        expect(page).to have_content(@hotel1.name)
      end
    
      within("div#room-#{@room3.id}") do
        expect(page).to have_content(@room3.suite)
        expect(page).to have_content(@room3.rate)
        expect(page).to have_content(@hotel1.name)
      end
    
      within("div#room-#{@room4.id}") do
        expect(page).to have_content(@room4.suite)
        expect(page).to have_content(@room4.rate)
        expect(page).to have_content(@hotel2.name)
      end
    
      within("div#room-#{@room5.id}") do
        expect(page).to have_content(@room5.suite)
        expect(page).to have_content(@room5.rate)
        expect(page).to have_content(@hotel2.name)
      end
    end
  end

  it "Each listed room includes the number of guests that have stayed in that room" do
    visit "/rooms"

    within("div#all-rooms") do
      within("div#room-#{@room1.id}") do
        expect(page).to have_content("# of guests who have stayed in this room: 3")
      end
    
      within("div#room-#{@room2.id}") do
        expect(page).to have_content("# of guests who have stayed in this room: 2")
      end
    
      within("div#room-#{@room3.id}") do
        expect(page).to have_content("# of guests who have stayed in this room: 1")
      end
    
      within("div#room-#{@room4.id}") do
        expect(page).to have_content("# of guests who have stayed in this room: 0")
      end
    
      within("div#room-#{@room5.id}") do
        expect(page).to have_content("# of guests who have stayed in this room: 0")
      end
    end
  end
end