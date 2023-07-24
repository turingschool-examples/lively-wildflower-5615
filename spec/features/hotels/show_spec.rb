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
    @room_3.guests << @leo
    @room_3.guests << @piper
    @room_1.guests << @sara
    @room_2.guests << @paige
    @room_1.guests << @paige
  end

  describe "when visiting the hotel show page" do 
    xit "I see a unique list of all guests that have stayed at this hotel" do 
      visit "/hotels/#{@emma.id}"

      expect(page).to have_content(@sara.name)
      expect(page).to have_content(@paige.name)
      expect(page).to_not have_content(@piper.name)
      expect(page).to_not have_content(@leo.name)
    end
  end
end