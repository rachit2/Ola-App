class CreateCabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cabs do |t|
      t.string :type
      t.integer :minimum_charge
      t.string :class

      t.timestamps
    end
  end
end
