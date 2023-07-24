class CreateGuest < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :nights

      t.timestamps
    end
  end
end
