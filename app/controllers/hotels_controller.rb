class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    # @guests_at_hotel = @hotel.hotel_guests
  end
end