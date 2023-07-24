class GuestsController < ApplicationController 

  def show 
    @guest = Guest.find(params[:id])
    @guest_rooms = Guest.find(params[:id]).rooms.first
  end

  def create 
    @guest = Guest.find(params[:id])
    @new_room = Room.find(params[:room_id])

    @guest.rooms << @new_room
    @guest.save

    redirect_to "/guests/#{@guest.id}"
  end
end