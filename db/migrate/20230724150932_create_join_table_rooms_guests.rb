class CreateJoinTableRoomsGuests < ActiveRecord::Migration[7.0]
  def change
    create_join_table :rooms, :guests do |t|
      # t.index [:room_id, :guest_id]
      # t.index [:guest_id, :room_id]
    end
  end
end
