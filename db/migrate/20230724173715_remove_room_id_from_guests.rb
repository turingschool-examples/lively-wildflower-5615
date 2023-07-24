class RemoveRoomIdFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :room_id
  end
end
