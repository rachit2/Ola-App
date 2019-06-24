class CreateCabDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cab_details do |t|
    	t.text :number_plate
    	t.references :cab
    	t.references :driver_detail
      t.timestamps
    end
  end
end
