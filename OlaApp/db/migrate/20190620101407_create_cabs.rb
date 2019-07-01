# frozen_string_literal: true

class CreateCabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cabs do |t|
      t.string :cab_type
      t.integer :minimum_charge, default: 0
      t.string :class_type
      t.integer :rate_per_km
      t.integer :rate_per_hour
      
      t.timestamps
    end
  end
end
