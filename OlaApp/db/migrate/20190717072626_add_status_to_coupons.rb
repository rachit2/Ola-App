class AddStatusToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :status, :string
  end
end
