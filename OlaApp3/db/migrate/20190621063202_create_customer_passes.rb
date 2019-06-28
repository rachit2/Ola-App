# frozen_string_literal: true

class CreateCustomerPasses < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_passes do |t|
      t.datetime :expiry_date
      t.references :user
      t.timestamps
    end
  end
end
