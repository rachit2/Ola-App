# frozen_string_literal: true

class CreateCabDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cab_details do |t|
      t.text :number_plate
      t.references :cab
      t.references :user
      t.references :circle
      t.timestamps
    end
  end
end
