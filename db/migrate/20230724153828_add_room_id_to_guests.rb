class AddRoomIdToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :room, foreign_key: true
  end
end
