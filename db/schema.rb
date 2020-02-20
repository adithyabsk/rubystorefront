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

ActiveRecord::Schema.define(version: 2020_02_20_192319) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "taxSlab"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "brand"
    t.boolean "restricted"
    t.boolean "ageRestricted"
    t.integer "quantity"
    t.string "imageURL"
    t.integer "category_id"
    t.integer "popularity", default: 0
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "isAdmin"
    t.string "otp_secret_key"
    t.string "phone_num"
    t.date "dob"
    t.string "address_l1"
    t.string "address_l2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "card_name"
    t.string "card_num"
    t.string "card_expire"
    t.integer "card_ccv"
  end

  add_foreign_key "items", "categories"
end
