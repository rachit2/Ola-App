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

ActiveRecord::Schema.define(version: 2019_06_20_103058) do

  create_table "cabs", force: :cascade do |t|
    t.string "type"
    t.integer "minimum_charge"
    t.string "class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "rates_per_km"
    t.integer "driver_charges"
    t.integer "cancel_charge"
    t.integer "paid_by_cash"
    t.integer "paid_by_card"
    t.integer "Ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Ride_id"], name: "index_rates_on_Ride_id"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "fare"
    t.integer "distance"
    t.string "from"
    t.string "to"
    t.datetime "wait_time"
    t.integer "Shift_id"
    t.integer "User_id"
    t.integer "Coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Coupon_id"], name: "index_rides_on_Coupon_id"
    t.index ["Shift_id"], name: "index_rides_on_Shift_id"
    t.index ["User_id"], name: "index_rides_on_User_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "login_time"
    t.datetime "logout_time"
    t.integer "Driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Driver_id"], name: "index_shifts_on_Driver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "mobile"
    t.text "address"
    t.text "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end