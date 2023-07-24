class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:hotel_id])
    @guests = @hotel.list_of_guests
  end
end