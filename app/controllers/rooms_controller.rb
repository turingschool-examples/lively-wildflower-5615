class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:rate, :suite, :hotel_id)
  end
end
