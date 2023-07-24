class GuestRoomsController <ApplicationController
  def create
    GuestRoom.create(guest_id: params[:guest_id], room_id: params[:room_id])

    redirect_to "/guests/#{params[:guest_id]}"
  end
end