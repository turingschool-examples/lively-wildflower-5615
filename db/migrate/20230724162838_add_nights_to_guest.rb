class AddNightsToGuest < ActiveRecord::Migration[7.0]
  def change 
    add_column :guests, :nights, :integer
  end
end
