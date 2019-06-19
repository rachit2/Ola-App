class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :type
      t.text :desc

      t.timestamps
    end
  end
end
