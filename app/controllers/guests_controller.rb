class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id]) # thing
  end
end