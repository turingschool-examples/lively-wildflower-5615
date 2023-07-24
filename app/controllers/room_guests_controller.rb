class RoomGuestsController < ApplicationController
  def create
    guest = Guest.find(params[:id])
    room = Room.find(params[:room_id])
    RoomGuest.create!(guest_id: guest.id, room_id: room.id)

    redirect_to "/guests/#{guest.id}"
  end
end