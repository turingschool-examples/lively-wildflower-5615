class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
  end

  def add_room
    @guest = Guest.find(params[:id])
    @guest.rooms << Room.find(params[:room_id])
    redirect_to "/guest/#{@guest.id}"
  end
  
end
