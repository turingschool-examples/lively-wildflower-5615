class GuestsController < ApplicationController
  def show
    @guests = Guest.find(params[:id]) 
    
  end
end