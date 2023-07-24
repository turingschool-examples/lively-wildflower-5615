require 'rails_helper'

RSpec.describe 'Guest Show Page', type: :feature do

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
        GuestRoom.create(room_id: @room_2.id, guest_id: @guest_2.id)
        GuestRoom.create(room_id: @room_3.id, guest_id: @guest_2.id)
    end

        describe 'As a visitor' do

            describe 'When I visit a guests show page' do 

                it 'Shows a list of all the rooms they have stayed in, the room suite, rate, and hotel name' do

                    visit "guest/#{@guest_1.id}"

                    within "#guest_info" do
                        expect(page).to have_content(@guest_1.name)
                        expect(page).to have_content(@room_1.suite)
                        expect(page).to have_content(@room_1.rate)
                        expect(page).to have_content(@hotel_1.name)
                    end

                end

                it 'Can add a room to the guest show page' do

                    visit "guest/#{@guest_4.id}"

                    within "#guest_info" do
                        expect(page).to have_content(@guest_4.name)
                        expect(page).to_not have_content(@room_4.suite)
                        expect(page).to_not have_content(@room_4.rate)
                        expect(page).to_not have_content(@hotel_2.name)
                    end

                    within "#room_form" do

                        fill_in "room_id", with: @room_4.id

                        click_button "Add Room"

                        expect(current_path).to eq("/guest/#{@guest_4.id}")
                    end

                    within "#guest_info" do
                        expect(page).to have_content(@guest_4.name)
                        expect(page).to have_content(@room_4.suite)
                        expect(page).to have_content(@room_4.rate)
                        expect(page).to have_content(@hotel_2.name)
                    end
                end
            end
        end
    end