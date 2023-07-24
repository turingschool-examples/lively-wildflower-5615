class GuestRoomsController <ApplicationController
  def create
    begin 
      guest_room = GuestRoom.new(guest_id: params[:guest_id], room_id: params[:room_id])
      guest_room.save!
      redirect_to "/guests/#{params[:guest_id]}"
      flash[:notice] = "Room added successfully!"
    rescue => exception
      redirect_to "/guests/#{params[:guest_id]}"
      flash[:alert] = "Room ID invalid - Please enter existing room ID"
    end
  end
end 