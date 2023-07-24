class GuestRoomsController < ApplicationController
  def create
    guest = GuestRoom.create!(guest_id: params[:id], room_id: params[:room_id])
    redirect_to "/guests/#{params[:id]}"
  end
end