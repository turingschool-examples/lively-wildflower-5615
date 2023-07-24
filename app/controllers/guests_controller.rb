class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:guest_id])
  end
  def update
    @guest = Guest.find(params[:guest_id])
    room = Room.find(params[:guest][:room_id])
    @guest.rooms << room

    redirect_to "/guests/#{@guest.id}"
  end
  def add_room
    @guest = Guest.find(params[:guest_id])
    room = Room.find(params[:room_id])
    @guest.rooms << room

    redirect_to "/guests/#{@guest.id}"
  end
end