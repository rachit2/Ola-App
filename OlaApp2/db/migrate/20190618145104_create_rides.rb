class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :fare
      t.integer :distance
      t.datetime :wait_time
 

      t.timestamps
    end
  end
end
