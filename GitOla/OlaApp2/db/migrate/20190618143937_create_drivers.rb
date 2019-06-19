class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.text :mobile
      t.text :password
      t.text :address
      t.text :email
      t.text :license_no
      t.text :expiry_date
      t.boolean :working
      t.integer :cab_id

      t.timestamps
    end
  end
end
