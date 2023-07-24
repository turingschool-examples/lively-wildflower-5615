class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
    @stays = @guest.stays
  end

  def update
    @guest = Guest.find(params[:id])
  end

  def add_room
    @guest = Guest.find(params[:id])
    room = Room.find(params[:room_id])
    @guest.rooms << room
    redirect_to guest_path(@guest)
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :nights)
  end
end
