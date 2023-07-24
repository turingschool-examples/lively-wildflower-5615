class GuestsController < ApplicationController
    def show
        @guest = Guest.find(params[:id])
    end

    def add_room
        @guest = Guest.find(params[:id])
        @room = Room.find(params[:room][:room_id])

        @guest.rooms << @room

        redirect_to "/guests/:id"
    end
end