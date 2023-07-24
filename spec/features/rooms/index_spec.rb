require 'rails_helper'

RSpec.describe 'Room Index Page', type: :feature do

    before(:each) do
        @hotel_1 = Hotel.create(name: 'Echo Mountain Inn', location: 'Echo Mountain')
        @hotel_2 = Hotel.create(name: 'Dead Inn', location: 'Lonely Road')
        
        @room_1 = @hotel_1.rooms.create(rate: 125, suite: "Presidential")
        @room_2 = @hotel_1.rooms.create(rate: 50, suite: "Budget")
        @room_3 = @hotel_2.rooms.create(rate: 125, suite: "Presidential")
        @room_4 = @hotel_2.rooms.create(rate: 75, suite: "Standard")

        @guest_1 = Guest.create(name: 'Charlize Theron', nights: 3)
        @guest_2 = Guest.create(name: 'Billy', nights: 1)
        @guest_3 = Guest.create(name: 'Timbo', nights: 3)
        @guest_4 = Guest.create(name: 'Jim', nights: 5)
        @guest_5 = Guest.create(name: 'Mary', nights: 4)
        @guest_6 = Guest.create(name: 'Tammy', nights: 4)

        GuestRoom.create(room_id: @room_1.id, guest_id: @guest_1.id)
        GuestRoom.create(room_id: @room_1.id, guest_id: @guest_2.id)
        GuestRoom.create(room_id: @room_1.id, guest_id: @guest_3.id)
        GuestRoom.create(room_id: @room_2.id, guest_id: @guest_2.id)
        GuestRoom.create(room_id: @room_2.id, guest_id: @guest_4.id)
        GuestRoom.create(room_id: @room_3.id, guest_id: @guest_2.id)
    end

    describe "As a visitor" do
        describe "When I visit the rooms index page" do
            it "Shows a list of all rooms with their suite,nightly rate, name of hotel it belongs to and count of guest stayed in that room" do

                visit "rooms"
                
                within "#room_#{@room_1.id}" do
                    expect(page).to have_content(@room_1.suite)
                    expect(page).to have_content(@room_1.rate)
                    expect(page).to have_content(@room_1.hotel.name)
                    expect(page).to have_content("Guest: 3")
                end
                within "#room_#{@room_2.id}" do
                    expect(page).to have_content(@room_2.suite)
                    expect(page).to have_content(@room_2.rate)
                    expect(page).to have_content(@room_2.hotel.name)
                    expect(page).to have_content("Guest: 2")
                end
                within "#room_#{@room_3.id}" do
                    expect(page).to have_content(@room_3.suite)
                    expect(page).to have_content(@room_3.rate)
                    expect(page).to have_content(@room_3.hotel.name)
                    expect(page).to have_content("Guest: 1")
                end
            end
        end
    end
end