# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_032922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "dispatcher_id"
    t.string "name"
    t.string "number"
    t.string "email"
    t.string "credit_cards"
    t.string "residence"
    t.string "passengers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dispatcher_id"], name: "index_accounts_on_dispatcher_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "vehicle_id"
    t.bigint "driver_id"
    t.bigint "dispatcher_id"
    t.datetime "date"
    t.datetime "pick_up_time"
    t.datetime "drop_off_time"
    t.string "pick_up_address"
    t.string "drop_off_address"
    t.string "trip_type"
    t.string "trip_status"
    t.decimal "price"
    t.string "payment_type"
    t.string "vehicle_type"
    t.string "special_notes"
    t.string "internal_notes"
    t.string "passenger_name"
    t.string "passenger_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_bookings_on_account_id"
    t.index ["dispatcher_id"], name: "index_bookings_on_dispatcher_id"
    t.index ["driver_id"], name: "index_bookings_on_driver_id"
    t.index ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dispatchers", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_dispatchers_on_company_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.string "cell_number"
    t.integer "created_by_dispatcher_id"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["company_id"], name: "index_drivers_on_company_id"
  end

  create_table "location_points", force: :cascade do |t|
    t.integer "booking_id"
    t.boolean "location_found", default: false, null: false
    t.decimal "pick_up_longitude", precision: 15, scale: 10
    t.decimal "pick_up_latitude", precision: 15, scale: 10
    t.decimal "drop_off_latitude", precision: 15, scale: 10
    t.decimal "drop_off_longitude", precision: 15, scale: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "distance"
    t.string "duration"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "company_id"
    t.string "vehicle_type"
    t.string "year"
    t.string "make"
    t.string "model"
    t.string "vin_number"
    t.string "license_plate"
    t.integer "mileage"
    t.integer "created_by_dispatcher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.index ["company_id"], name: "index_vehicles_on_company_id"
  end

end
