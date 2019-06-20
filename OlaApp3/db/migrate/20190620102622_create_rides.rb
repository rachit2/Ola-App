class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :fare
      t.integer :distance
      t.string :from
      t.string :to
      t.datetime :wait_time
      t.references :Shift, foreign_key: true
      t.references :User, foreign_key: true
      t.references :Coupon, foreign_key: true
      
      t.timestamps
    end
  end
end
