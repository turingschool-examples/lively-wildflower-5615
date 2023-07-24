class GuestsController < ApplicationController 

  def show
    @guests = Guest.all
    @guest = Guest.find(params[:id])
  end
end