class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :rates_per_km
      t.integer :driver_charges
      t.integer :cancel_charges

      t.timestamps
    end
  end
end
