class RoomGuestsController < ApplicationController
  def create
    room_guest = RoomGuest.create(room_guest_params)

    redirect_to "/guests/#{room_guest_params[:guest_id]}"
  end

  private
  def room_guest_params
    params.permit(:room_id, :guest_id)
  end
end