class AddGuestIdToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :guest, null: false, foreign_key: true
  end
end
