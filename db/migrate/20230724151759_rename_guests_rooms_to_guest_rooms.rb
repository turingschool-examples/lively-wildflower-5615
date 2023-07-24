class RenameGuestsRoomsToGuestRooms < ActiveRecord::Migration[7.0]
  def change
    rename_table :guests_rooms, :guest_rooms
  end
end
