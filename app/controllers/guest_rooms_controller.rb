class GuestRoomsController < ApplicationController
  def create
    @guest = Guest.find(params[:id])
    @room = Room.find(params[:room_id])
    @guest.rooms << @room
    @guest.save
    redirect_to "/guests/#{@guest.id}"
  end
end