class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
  end

  def add_room
    @guest = Guest.find(params[:id])
    room_id = params[:room_id]

    room = Room.find_by(id: room_id)
    @guest.rooms << room if room

    redirect_to "/guests/#{params[:id]}"
  end
end