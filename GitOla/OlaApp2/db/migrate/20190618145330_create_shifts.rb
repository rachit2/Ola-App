class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.datetime :login_time
      t.datetime :logout_time

      t.timestamps
    end
  end
end
