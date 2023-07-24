class GuestsController < ApplicationController 

  def show 
    @guest = Guest.find(params[:id])
    @guest_rooms = Guest.find(params[:id]).rooms.first
  end
end