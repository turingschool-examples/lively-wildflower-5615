class GuestRoomsController < ApplicationController
  def create
    @guest_room = GuestRoom.create!(guest_id: params[:id], room_id: params[:room_id])
    redirect_to "/guests/#{@guest_room.guest_id}"
  end
end