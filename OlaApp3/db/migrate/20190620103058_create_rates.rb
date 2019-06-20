class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :rates_per_km
      t.integer :driver_charges
      t.integer :cancel_charge
      t.integer :paid_by_cash
      t.integer :paid_by_card
      t.references :Ride, foreign_key: true

      t.timestamps
    end
  end
end
