# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :cancel_charge, default: 0
      t.string :payment_status
      t.integer :total_amount
      t.references :user
      t.timestamps
    end
  end
end
