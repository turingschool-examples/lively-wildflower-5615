class RemoveSuiteAndAddNightToGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :suite, :string
    add_column :guests, :nights, :integer
  end
end
