class CreateRoomGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :room_guests do |t|
      t.references :room, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
