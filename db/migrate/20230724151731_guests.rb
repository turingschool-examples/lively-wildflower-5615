class Guests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :nights
    end
  end
end
