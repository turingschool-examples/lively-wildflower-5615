class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def hotels_params
    params.require(:hotel).permit(:name, :location)
  end
end
