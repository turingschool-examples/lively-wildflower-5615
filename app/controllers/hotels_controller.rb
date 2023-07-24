class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @unique_guests = @hotel.list_unique_guests
  end
end