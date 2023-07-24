class RemoveRoomIdFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :guests, :room, null: false, foreign_key: true
  end
end
