class CreateHotelRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
