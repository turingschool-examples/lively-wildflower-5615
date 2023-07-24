class AddRoomReferenceToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :room, null: false, foreign_key: true
  end
end
