class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
    @stays = @guest.stays
  end

  def add_room
    @guest = Guest.find(params[:id])
    @guest.add_room(params[:room_id])
    redirect_to guest_path(@guest)
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :nights)
  end
end
