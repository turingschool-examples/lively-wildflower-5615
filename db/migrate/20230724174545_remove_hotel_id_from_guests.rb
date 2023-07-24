class RemoveHotelIdFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :hotel_id, :bigint
  end
end
