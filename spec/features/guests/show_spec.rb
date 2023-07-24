require "rails_helper"

RSpec.describe "Show spec" do
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
  # user story 1
  describe "As a visitor, when going to the guest show page" do
    it "has the guests name and a list of all rooms they are in:shows room's suite, nightly rate, and the name of the hotel that it belongs to" do
      visit "/guests/#{@paige.id}"

      expect(page).to have_content(@paige.name)
      expect(page).to have_content(@room_2.rate)
      expect(page).to have_content(@room_1.rate)
      expect(page).to have_content(@room_2.suite)
      expect(page).to have_content(@room_1.suite)
      expect(page).to have_content(@emma.name)
      expect(page).to_not have_content(@wolf.name)
      expect(page).to_not have_content(@piper.name)
      expect(page).to_not have_content(@room_3.suite)
    end

    it "has the guests name and a list of all rooms they are in:shows room's suite, nightly rate, and the name of the hotel that it belongs to" do
      visit "/guests/#{@sara.id}"

      expect(page).to have_content(@sara.name)
      expect(page).to have_content(@room_4.suite)
      expect(page).to have_content(@room_1.suite)
      expect(page).to have_content(@emma.name)
      expect(page).to have_content(@wolf.name)
    end

    # user story 2
    it "I see a form to add a room to this guest, filed in with the id of and already existing room, its takes me back to show page." do 
      visit "guests/#{@piper.id}"

      fill_in "room_id", with: @room_2.id
      click_on "submit"

      expect(page).to have_content(@room_2.rate)
      expect(page).to have_content(@room_2.suite)
      expect(page).to have_content(@emma.name)
      expect(current_path).to eq("/guests/#{@piper.id}")

      fill_in "room_id", with: @room_1.id
      click_on "submit"

      expect(page).to have_content(@room_1.rate)
      expect(page).to have_content(@room_1.suite)
      expect(page).to have_content(@emma.name)
    end
  end
end