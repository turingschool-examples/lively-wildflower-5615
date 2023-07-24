class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
    @rooms_stayed_in = @guest.rooms
  end

  def create
    @guest = Guest.find(params[:id])
    room = Room.find(params[:guest][:room_id])
    
    @guest.rooms << room

    redirect_to "/guests/#{@guest.id}"
  end
end