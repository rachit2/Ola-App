class CreateDriverDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_details do |t|
      t.string :license_no
      t.date_time :expiry_date
      t.references :Cab, foreign_key: true
      
      t.timestamps
    end
  end
end
