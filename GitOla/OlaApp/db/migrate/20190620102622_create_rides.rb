# frozen_string_literal: true

class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :distance
      t.string :pickup_point
      t.string :drop_point
      t.datetime :wait_time
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.references :coupon
      t.references :user
      t.references :driver_detail
      t.timestamps
    end
  end
end
