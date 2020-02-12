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

ActiveRecord::Schema.define(version: 2020_02_12_162647) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.boolean "restricted"
    t.boolean "ageRestricted"
    t.integer "quantity"
    t.float "cost"
    t.string "taxSlab"
    t.string "imageURL"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "status"
    t.integer "item_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_requests_on_item_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "restricted_requests", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_restricted_requests_on_item_id"
    t.index ["user_id"], name: "index_restricted_requests_on_user_id"
  end

  create_table "return_requests", force: :cascade do |t|
    t.string "date"
    t.integer "item_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_return_requests_on_item_id"
    t.index ["user_id"], name: "index_return_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "phoneNumber"
    t.string "dateOfBirth"
    t.string "addressL1"
    t.string "addressL2"
    t.string "adressL3"
    t.string "cardName"
    t.string "cardNum"
    t.string "cardExpire"
    t.integer "cardCCV"
    t.boolean "isAdmin"
    t.boolean "hasSecurePassword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
