require "rails_helper"

RSpec.describe "Guests show page" do
  before(:each) do
    @hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @hotel_2 = Hotel.create!(name: 'Overlook', location: "colorado")
    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Presidential")
    @room_2 = @hotel_1.rooms.create!(rate: 25, suite: "Ground Floor")
    @guest_1 = @room_1.guests.create!(name: 'Charlize Theron', nights: 3)
  end
  #As a visitor
  #When I visit a guest's show page
  #I see the guest's name
  #And I see a list of all the rooms they've stayed in
  #including the room's suite, nightly rate, and the name of the hotel that it belongs to.
    describe "When I visit a guest's show page" do
      it "I see the guest's name, room's suite, nightly rate, name of hotel" do
        visit "/guests/#{@guest_1.id}"
        save_and_open_page
        expect(page).to have_content(@guest_1.name)
        expect(page).to have_content(@room_1.suite)
        expect(page).to have_content(@room_1.rate)
        expect(page).to have_content(@hotel_1.name)
  
       

      end
      



    
  end

end