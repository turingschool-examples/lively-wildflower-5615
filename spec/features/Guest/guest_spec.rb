require 'rails_helper'

RSpec.describe 'Guest Show', type: :feature do 
  before :each do
    @hotel = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
    @guest_1 = Guest.create!(name: "Charlize", nights: 3)

    @guest_2 = Guest.create!(name: "Hank", nights: 5)

    @room_1 = @hotel.rooms.create!(rate: 100, suite: "Presidential Suite")
    @room_2 = @hotel.rooms.create!(rate: 50, suite: "Honeymoon Suite")

    @guest_room_1 = GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
  end

  it 'displays the guest name, rooms they have stayed in, nightly rate and hotel' do 
  
    visit "/guests/#{@guest_1.id}"
    
    expect(page).to have_content(@guest_1.name)
    expect(page).to have_content(@guest_1.nights)
    expect(page).to have_content(@room_1.suite)
    expect(page).to have_content(@room_1.rate)
    expect(page).to have_content("Echo Mountain Inn")
  end

  it 'displays a form to add a new room to the guest' do 

    visit "/guests/#{@guest_1.id}"
    
    expect(page).to have_button("Add a Room")

    within "#add_room" do 
      fill_in :room_id, with: @room_2.id
      click_button "Add a Room"
    end
    
    expect(current_path).to eq("/guests/#{@guest_1.id}")
    expect(page).to have_content(@room_2.suite)
  end
end