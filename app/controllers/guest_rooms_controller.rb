class GuestRoomsController < ApplicationController
  def create
    guest = Guest.find(params[:id])
    room = Room.find(params[:add_room_id])

    guest.rooms.push(room)
    guest.save

    redirect_to "/guests/#{guest.id}"
  end
end