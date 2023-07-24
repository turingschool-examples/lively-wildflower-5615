
class GuestRoomsController < ApplicationController
    def create
        @guest = Guest.find(params[:id])
        @room = Room.find(params[:guest_room][:room_id])
        
        # Create the association between the guest and the room
        @guest.rooms << @room
      
      redirect_to "/guest/#{@guest.id}", notice: 'Room was successfully added to the guest.'
    end
  end
  