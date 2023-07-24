class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    # I was pretty sure that you could call the model method
    #  in the veiw since its just reading the output 
    #  and not dealing with data 
  end
end