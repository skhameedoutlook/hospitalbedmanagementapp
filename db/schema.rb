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

ActiveRecord::Schema.define(version: 2020_12_31_084201) do

  create_table "beds", force: :cascade do |t|
    t.string "bedtype"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "cost", default: 10.0
  end

  create_table "requests", force: :cascade do |t|
    t.string "username"
    t.string "bedtype"
    t.integer "quantity"
    t.boolean "requestcompleted"
    t.boolean "checkedin"
    t.datetime "checkintime"
    t.boolean "checkedout"
    t.datetime "checkouttime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "expired", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password"
    t.string "usertype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
