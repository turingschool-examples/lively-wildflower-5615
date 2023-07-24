
class RoomsController < ApplicationController
    def index
      @rooms = Room.includes(:hotel, :guests).all
    end
  end
  