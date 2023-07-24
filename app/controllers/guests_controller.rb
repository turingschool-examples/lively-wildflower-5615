class GuestsController < ApplicationController
    def show
        @guest = Guest.find(params[:id])
        @rooms = @guest.rooms.includes(:hotel)
    end
end