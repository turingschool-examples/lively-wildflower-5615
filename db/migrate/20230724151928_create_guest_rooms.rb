class CreateGuestRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_rooms do |t|
      t.references :guest, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end

