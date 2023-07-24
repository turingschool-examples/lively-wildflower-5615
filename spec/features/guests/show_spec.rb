require "rails_helper"


RSpec.describe "guest show page" do
  before(:each) do
    @powder = Hotel.create!(name: "Powder Palace", location: "Powder mountain")
    @eagle = Hotel.create!(name: "Eagle's Nest", location: "Eagle mountain")

    @room_1p = @powder.rooms.create!(suite: "Diamond", rate: 5000)
    @room_2p = @powder.rooms.create!(suite: "Gold", rate: 3000)
    @room_3p = @powder.rooms.create!(suite: "Silver", rate: 2000)

    @guest_1 = @room_1p.guests.create!(name: "Margo Robbie", nights: 3)
    @guest_2 = @room_2p.guests.create!(name: "Margo Robbie", nights: 5)
    @guest_3 = @room_1p.guests.create!(name: "Margo Robbie", nights: 2)
    @guest_4 = @room_3p.guests.create!(name: "Kevin Bacon", nights: 1)
    @guest_5 = @room_2p.guests.create!(name: "Kevin Bacon", nights: 3)
    @guest_6 = @room_3p.guests.create!(name: "Kevin Bacon", nights: 2)
  end

  
    #User Story 1
    #   As a visitor
    # When I visit a guest's show page
    # I see the guest's name
    # And I see a list of all the rooms they've stayed in
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to.

  describe "as a visitor, when I visit the guest's show page" do
    it "I see the guest's name and a list of all the rooms they've stayed in along with suite and hotel names." do
      require "pry" ; binding.pry
      
    end
  end

end