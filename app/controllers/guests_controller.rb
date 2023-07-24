class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
  end

  # def update
  #   guest = Guest.find(params[:id])
  #   #require 'pry'; binding.pry
  #   guest.add_room
  #   guest.update
  #   redirect_to "guest/#{guest.id}"
  # end

  # def new_room_params
  #   params.permit(:room_id)
  # end
end