class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :guest, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
