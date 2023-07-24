require "rails_helper"

RSpec.describe "hotel show page" do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Hotel California", location: "California")

    @guest_1 = Guest.create!(name: "Jorge", nights: 2)
    @guest_2 = Guest.create!(name: "Nancy", nights: 3)

    @room_1 = @hotel_1.rooms.create!(rate: 125, suite: "Economy")
    @room_2 = @hotel_1.rooms.create!(rate: 500, suite: "Presidential")
    
    GuestRoom.create!(guest: @guest_1, room: @room_1)
    GuestRoom.create!(guest: @guest_2, room: @room_1)
  end

  describe "as a visitor" do
    describe "when I visit a hotel's show page"
      it "I see a unique list of all guests that have stayed at this hotel" do
        visit "/hotels/#{@hotel_1.id}" 

        expect(page).to have_content(@guest_1.name)
        expect(page).to have_content(@guest_2.name)
      end
  end
end