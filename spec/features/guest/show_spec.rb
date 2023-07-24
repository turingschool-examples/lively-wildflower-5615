require 'rails_helper'

RSpec.describe "Guest Show" do
  before :each do
    @hotel_1 = Hotel.create!(name: "Sheraton", location: "Denver")
    @room_1 = @hotel_1.rooms.create!(rate: 50, suite: "2 bedroom")
    @room_2 = @hotel_1.rooms.create!(rate: 100, suite: "Penthouse")
    @guest_1 = @room_1.guests.create!(name: "Steve", nights: 3)
    @room_3 = @hotel_1.rooms.create!(rate: 25, suite: "1 bedroom")
    #GuestRoom.create!(rooms_id: @room_1.id, guests_id: @guest_1.id)
  end
#User Story 1
#   As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.

  describe "visits show page" do
    it "shows the guests name and a list of all the rooms they've stayed in" do
      visit "/guests/#{@guest_1.id}"
      expect(page).to have_content("Steve")
      expect(page).to have_content(@room_1.rate)
      expect(page).to have_content(@room_1.suite)
      expect(page).to have_content(@room_1.hotel.name)
      #save_and_open_page
    end


    #User Story 2
    #As a visitor
    # When I visit a guest's show page
    # Then I see a form to add a room to this guest.
    # When I fill in a field with the id of an existing room
    # And I click submit
    # Then I am redirected back to the guest's show page
    # And I see the room now listed under this guest's rooms.
    # (You do not have to test for a sad path, for example if the ID submitted is not an existing room)

    it "displays a form to add a room to this guest" do
      visit "/guests/#{@guest_1.id}"
      #save_and_open_page
      fill_in('room_id', with: @room_3.id)
      
      click_on 'Submit'
      expect(page).to have_content("1 bedroom")
      expect(page).to have_content(25)
      #save_and_open_page
    end




    
  
  end


end