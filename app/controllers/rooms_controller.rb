class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
    @hotel = Room.first.hotel_name
    @count = Room.first.guest_count
  end
end