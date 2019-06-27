class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
       t.string :card_number
      # t.integer :rate_per_km
      # t.integer :driver_charge
      t.integer :cancel_charge, :default =>0
      t.string :payment_status
      t.integer :total_amount
      t.references :user
      t.timestamps
    end
  end
end