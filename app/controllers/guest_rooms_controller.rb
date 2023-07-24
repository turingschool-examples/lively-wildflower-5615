class GuestRoomsController < ApplicationController
    def create
        @guest_room = GuestRoom.create(room_id: params[:room_id], guest_id: params[:id])
        redirect_to "/guest/#{params[:id]}"
    end
end