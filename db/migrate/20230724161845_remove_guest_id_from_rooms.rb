class RemoveGuestIdFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_reference :rooms, :guest, null: false, foreign_key: true
  end
end
