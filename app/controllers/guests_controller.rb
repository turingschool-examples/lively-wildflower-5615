class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
    @stays = @guest.stays
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
  end

  def destroy
    Guest.find(params[:id]).destroy
    redirect_to guests_path
  end

  def add_room
    @guest = Guest.find(params[:id])
    room = Room.find(params[:room_id])
    @guest.rooms << room
    redirect_to guest_path(@guest)
  end
end
