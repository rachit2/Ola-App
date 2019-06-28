# frozen_string_literal: true

class CreateJoinTableUserRide < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :rides do |t|
      t.index %i[user_id ride_id]
      t.index %i[ride_id user_id]
    end
  end
end
