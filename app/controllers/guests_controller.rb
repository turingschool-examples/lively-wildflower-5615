class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
    @rooms_stayed_in = @guest.rooms
  end
end