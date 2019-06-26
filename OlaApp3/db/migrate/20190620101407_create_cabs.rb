class CreateCabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cabs do |t|
      t.string :cab_type
      t.integer :minimum_charge
      t.string :class_type
      t.integer :rate_per_km
      t.timestamps
    end
  end
end
