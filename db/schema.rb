# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_24_153229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_rooms", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_guest_rooms_on_guest_id"
    t.index ["room_id"], name: "index_guest_rooms_on_room_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.integer "nights"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "rate"
    t.string "suite"
    t.bigint "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "guest_rooms", "guests"
  add_foreign_key "guest_rooms", "rooms"
  add_foreign_key "rooms", "hotels"
end
