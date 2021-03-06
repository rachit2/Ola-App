# frozen_string_literal: true

class CreateDriverDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_details do |t|
      t.string :license_no
      t.datetime :expiry_date
      t.string :shift
      t.string :status
      t.datetime :tenure_expiry_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
