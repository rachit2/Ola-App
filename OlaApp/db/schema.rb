# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_01_081128) do

  create_table "cab_details", force: :cascade do |t|
    t.text "number_plate"
    t.integer "cab_id"
    t.integer "user_id"
    t.integer "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cab_id"], name: "index_cab_details_on_cab_id"
    t.index ["circle_id"], name: "index_cab_details_on_circle_id"
    t.index ["user_id"], name: "index_cab_details_on_user_id"
  end

  create_table "cabs", force: :cascade do |t|
    t.string "cab_type"
    t.integer "minimum_charge", default: 0
    t.string "class_type"
    t.integer "rate_per_km"
    t.integer "rate_per_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circles", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_circles_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_passes", force: :cascade do |t|
    t.datetime "expiry_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customer_passes_on_user_id"
  end

  create_table "driver_details", force: :cascade do |t|
    t.string "license_no"
    t.datetime "expiry_date"
    t.string "shift"
    t.string "status"
    t.datetime "tenure_expiry_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_driver_details_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "cancel_charge", default: 0
    t.string "payment_status"
    t.integer "total_amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "distance"
    t.string "pickup_point"
    t.string "drop_point"
    t.datetime "wait_time"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.integer "coupon_id"
    t.integer "user_id"
    t.integer "driver_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_rides_on_coupon_id"
    t.index ["driver_detail_id"], name: "index_rides_on_driver_detail_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "rides_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ride_id", null: false
    t.index ["ride_id", "user_id"], name: "index_rides_users_on_ride_id_and_user_id"
    t.index ["user_id", "ride_id"], name: "index_rides_users_on_user_id_and_ride_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "mobile"
    t.text "address"
    t.boolean "admin", default: false
    t.integer "city_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
